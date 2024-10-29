import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:stockkeeper/app/categories/new/page.dart';
import 'package:stockkeeper/app/categories/edit/page.dart';
import 'package:stockkeeper/app/items/id/page.dart';
import 'package:stockkeeper/app/items/new/page.dart';
import 'package:stockkeeper/app/login/page.dart';
import 'package:stockkeeper/app/cart/page.dart';
import 'package:stockkeeper/utils/graphql.dart';
import 'package:stockkeeper/providers/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stockkeeper/features/login/components/bottomSheet.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'authWrapper.dart';

void main() async {
  const env = String.fromEnvironment('ENV', defaultValue: 'local');
  print('env:.env.$env');
  await dotenv.load(fileName: '.env.$env');

  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final appEnv = dotenv.env['APP_ENV'];

  await FirebaseAppCheck.instance.activate(
    // Androidの場合はApp Distributionを使用する Play Integrityの認証が成功しないのでdebugの方で実装
    androidProvider: appEnv == 'production'
        ? AndroidProvider.playIntegrity
        : AndroidProvider.debug,
    appleProvider:
        kReleaseMode ? AppleProvider.deviceCheck : AppleProvider.debug,
  );
  await initHiveForFlutter();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<GraphQLClient> client =
        ValueNotifier<GraphQLClient>(graphqlClient());

    final navigatorKey = ref.read(navigatorKeyProvider);

    return GraphQLProvider(
        client: client,
        child: MaterialApp.router(
          routerConfig: goRouter(navigatorKey),
          title: 'Stock Keeper',
          theme: ThemeData(
              fontFamily: 'NotoSansJP',
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.white)),
              scaffoldBackgroundColor: Colors.transparent,
              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
                bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
                bodySmall: TextStyle(color: Colors.white, fontSize: 14),
              )),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ja'), // 日本語
          ],
        ));
  }
}

GoRouter goRouter(navigatorKey) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          name: "home",
          pageBuilder: (context, state) {
            return MaterialPage(key: state.pageKey, child: const AuthWrapper());
          },
          routes: [
            GoRoute(
              path: "guest/scan",
              name: "guest_scan",
              pageBuilder: (context, state) {
                return BottomSheetPage(
                    builder: (_) => const ShareBottomSheet(code: ""));
              },
            ),
            GoRoute(
              path: "guest/login/:code",
              name: "guest_login",
              pageBuilder: (context, state) {
                final code = state.pathParameters['code']!;
                return BottomSheetPage(
                    builder: (_) => ShareBottomSheet(code: code));
              },
            ),
            GoRoute(
                path: 'categories/new',
                name: "category_new",
                pageBuilder: (context, state) {
                  final args = state.extra as CategoryNew;
                  return MaterialPage(
                      key: state.pageKey,
                      child: CategoryNew(
                        onCallback: args.onCallback,
                      ));
                }),
            GoRoute(
                path: 'categories/edit',
                name: "category_edit",
                pageBuilder: (context, state) {
                  final args = state.extra as CategoryEdit;
                  return MaterialPage(
                      key: state.pageKey,
                      child: CategoryEdit(
                          id: args.id,
                          name: args.name,
                          onCallback: args.onCallback));
                }),
            GoRoute(
                path: 'items/new',
                name: "item_new",
                pageBuilder: (context, state) {
                  final args = state.extra as NewItem;
                  return MaterialPage(
                      key: state.pageKey,
                      child: NewItem(
                          scanBarcode: args.scanBarcode,
                          categoryId: args.categoryId,
                          onCallback: args.onCallback));
                }),
            GoRoute(
                path: 'items/:id',
                name: "item_detail",
                pageBuilder: (context, state) {
                  final args = state.extra as ItemDetail;
                  final id = int.tryParse(state.pathParameters['id']!)!;
                  return MaterialPage(
                      key: state.pageKey,
                      child: ItemDetail(id: id, onCallback: args.onCallback));
                }),
            GoRoute(
                path: 'login',
                name: "login",
                pageBuilder: (context, state) {
                  return MaterialPage(key: state.pageKey, child: const Login());
                }),
            GoRoute(
                path: 'cart',
                name: "cart",
                pageBuilder: (context, state) {
                  return MaterialPage(key: state.pageKey, child: const Cart());
                }),
          ]),
    ],
    // 遷移ページがないなどのエラーが発生した時に、このページに行く
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );
}

class BottomSheetPage<T> extends Page<T> {
  final WidgetBuilder builder;
  final Offset? anchorPoint;
  final String? barrierLabel;
  final CapturedThemes? themes;

  const BottomSheetPage({
    required this.builder,
    this.anchorPoint,
    this.barrierLabel,
    this.themes,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute(
      settings: this,
      builder: builder,
      anchorPoint: anchorPoint,
      barrierLabel: barrierLabel,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height,
      ),
      useSafeArea: true,
      showDragHandle: true,
      elevation: 1.0,
    );
  }
}
