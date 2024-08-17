import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stockkeeper/app/categories/page.dart';
import 'package:stockkeeper/app/categories/new/page.dart';
import 'package:stockkeeper/app/categories/edit/page.dart';
import 'package:stockkeeper/app/items/id/page.dart';
import 'package:stockkeeper/app/items/new/page.dart';
import 'package:stockkeeper/app/login/page.dart';
import 'package:stockkeeper/app/cart/page.dart';
import 'package:stockkeeper/utils/graphql.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockkeeper/features/login/components/bottomSheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase_options.dart';
import 'authWrapper.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initHiveForFlutter();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> client =
        ValueNotifier<GraphQLClient>(graphqlClient());

    return GraphQLProvider(
        client: client,
        child: MaterialApp.router(
          routerConfig: goRouter,
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

class AuthWrapper2 extends ConsumerWidget {
  const AuthWrapper2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, authSnapshot) {
        print('authSnapshot: $authSnapshot');
        if (authSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (authSnapshot.hasData) {
          return const MyHomePage();
        } else {
          return const Login();
        }
      },
    );
  }
}

final goRouter = GoRouter(
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
