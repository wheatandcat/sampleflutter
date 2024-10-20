import 'package:flutter/material.dart';
import 'package:stockkeeper/utils/style.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/graphql/invite.gql.dart';
import 'package:stockkeeper/graphql/createInvite.gql.dart';
import 'package:stockkeeper/graphql/updateInviteCode.gql.dart';
import 'package:stockkeeper/components/loading/progress.dart';

class ShareBottomSheet extends HookWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final code = useState<String>("");

    final mci = useMutation$CreateInvite(WidgetOptions$Mutation$CreateInvite(
      onCompleted: (Map<String, dynamic>? data, Mutation$CreateInvite? result) {
        code.value = result?.createInvite.code ?? "";
      },
      onError: (error) {
        debugPrint(error.toString());
      },
    ));

    final muic =
        useMutation$UpdateInviteCode(WidgetOptions$Mutation$UpdateInviteCode(
      onCompleted:
          (Map<String, dynamic>? data, Mutation$UpdateInviteCode? result) {
        code.value = result?.updateInviteCode.code ?? "";
      },
      onError: (error) {
        debugPrint(error.toString());
      },
    ));

    final qri = useQuery$Invite(Options$Query$Invite(
      onComplete: (Map<String, dynamic>? data, Query$Invite? result) {
        if (result?.invite == null) {
          mci.runMutation();
        } else {
          code.value = result?.invite?.code ?? "";
        }
      },
    ));

    final loading = qri.result.isLoading || qri.result.data?["invite"] == null;

    void onRefresh() {
      qri.refetch();
    }

    final inviteURL =
        "https://stock-keeper-review.web.app/guest/login/${code.value}";

    return Padding(
        padding: const EdgeInsets.only(
            top: Spacing.md,
            bottom: Spacing.xl,
            left: Spacing.md,
            right: Spacing.md), // 上に20、下に10の余白を追加
        child: Stack(children: <Widget>[
          Wrap(
            children: <Widget>[
              const ListTile(
                title: Text("リストを共有する",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: FontSize.md,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: Spacing.lg),
                  child: Container(
                    alignment: Alignment.center,
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.borderDark,
                      ),
                    ),
                    child: loading
                        ? const Progress(
                            color: AppColors.textDark,
                          )
                        : QrImageView(
                            data: inviteURL,
                            version: QrVersions.auto,
                            size: 125.0,
                          ),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                      top: Spacing.xl, bottom: Spacing.lg),
                  child: const Text('共有したい端末でQRコードを\nスキャンしてください',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: FontSize.md,
                        fontWeight: FontWeight.bold,
                      )))
            ],
          ),
          Positioned(
            top: 12,
            right: 20,
            child: SizedBox(
                width: 30,
                height: 30,
                child: FloatingActionButton(
                    heroTag: "setting",
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: AppColors.textDark,
                        width: 1.0,
                      ),
                    ),
                    onPressed: () {
                      muic.runMutation();
                    },
                    tooltip: 'Increment',
                    child: const Icon(
                      Icons.refresh,
                      color: AppColors.textDark,
                      size: 22,
                    ))),
          ),
        ]));
  }
}
