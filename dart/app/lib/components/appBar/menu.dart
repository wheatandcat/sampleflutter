import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stockkeeper/features/category/components/share/bottomSheet.dart';
import 'package:stockkeeper/providers/guest.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stockkeeper/utils/auth.dart';
import 'package:stockkeeper/utils/guest.dart';
import 'package:stockkeeper/graphql/logoutGuest.gql.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppBarMenu extends HookConsumerWidget {
  const AppBarMenu({super.key});

  void showCustomMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const ShareBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guestDataAsyncValue = ref.watch(guestDataProvider);
    final isGuest = guestDataAsyncValue.asData?.value?.uid != null;

    final mlg = useMutation$LogoutGuest(WidgetOptions$Mutation$LogoutGuest(
      onCompleted:
          (Map<String, dynamic>? data, Mutation$LogoutGuest? result) async {
        final g = Guest();
        await g.deleteUid();
        ref.read(guestStateProvider.notifier).state =
            GuestData(id: "", uid: "");

        if (!context.mounted) return;
        context.pop();
      },
      onError: (error) {
        debugPrint(error.toString());
      },
    ));

    onLogout() async {
      if (!isGuest) {
        final AuthService authService = AuthService();
        await authService.deleteToken();

        await FirebaseAuth.instance.signOut();

        if (!context.mounted) return;
        context.pop();
      } else {
        mlg.runMutation();
      }
    }

    return GestureDetector(
      child: Dialog(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: Spacing.lg,
                  bottom: Spacing.xl,
                  right: Spacing.lg,
                  left: Spacing.lg),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Align(
                      alignment: Alignment.center,
                      child: Text("設定",
                          style: TextStyle(
                              fontSize: FontSize.lg,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  (!isGuest)
                      ? InkWell(
                          onTap: () {
                            context.pop();
                            showCustomMenu(context);
                          },
                          child: const Card(
                            margin: EdgeInsets.zero,
                            color: Colors.transparent,
                            elevation: 0,
                            shape: Border(
                                bottom: BorderSide(
                                    color: AppColors.textDark, width: 0.0)),
                            child: ListTile(
                              title: Text("リストを共有する",
                                  style: TextStyle(
                                      color: AppColors.textDark,
                                      fontSize: FontSize.md,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ))
                      : const SizedBox(),
                  const Card(
                    margin: EdgeInsets.zero,
                    color: Colors.transparent,
                    elevation: 0,
                    shape: Border(
                        bottom:
                            BorderSide(color: AppColors.textDark, width: 0.0)),
                    child: ListTile(
                      title: Text("利用規約",
                          style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: FontSize.md,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const Card(
                    margin: EdgeInsets.zero,
                    color: Colors.transparent,
                    elevation: 0,
                    shape: Border(
                        bottom:
                            BorderSide(color: AppColors.textDark, width: 0.0)),
                    child: ListTile(
                      title: Text("プライバシー・ポリシー",
                          style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        onLogout();
                      },
                      child: const Card(
                        margin: EdgeInsets.zero,
                        color: Colors.transparent,
                        elevation: 0,
                        shape: Border(
                            bottom: BorderSide(
                                color: AppColors.textDark, width: 0.0)),
                        child: ListTile(
                          title: Text("ログアウト",
                              style: TextStyle(
                                  color: AppColors.error,
                                  fontSize: FontSize.md,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )),
                  Card(
                    margin: EdgeInsets.zero,
                    color: Colors.transparent,
                    elevation: 0,
                    child: ListTile(
                      title: Text("v 1.0.0 (${dotenv.env['APP_ENV']})",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.textDark,
                            fontSize: FontSize.sm,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8, // 位置を適切に調整
              left: 8, // 位置を適切に調整
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => context.pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
