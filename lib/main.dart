import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sampleflutter/app/items/page.dart';
import 'package:sampleflutter/app/categories/page.dart';
import 'package:sampleflutter/app/categories/new/page.dart';
import 'package:sampleflutter/app/categories/edit/page.dart';
import 'package:sampleflutter/app/items/id/page.dart';
import 'package:sampleflutter/app/items/new/page.dart';
import 'package:sampleflutter/app/login/page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
        HttpLink('https://stock-keeper-voytob3xvq-an.a.run.app/graphql');

    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );

    return GraphQLProvider(
        client: client,
        child: MaterialApp(
          title: 'Stock Keeper',
          theme: ThemeData(
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.white)),
              scaffoldBackgroundColor: Colors.brown[200]),
          home: const MyHomePage(),
          routes: {
            '/login': (context) => const Login(),
          },
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/categories/new':
                final args = settings.arguments as CategoryNew;

                return PageTransition(
                  child: CategoryNew(
                    onCallback: args.onCallback,
                  ),
                  type: PageTransitionType.bottomToTop,
                  duration: const Duration(milliseconds: 150),
                  reverseDuration: const Duration(milliseconds: 150),
                  settings: settings,
                );
              case '/categories/edit':
                final args = settings.arguments as CategoryEdit;

                return PageTransition(
                  child: CategoryEdit(
                      id: args.id,
                      name: args.name,
                      onCallback: args.onCallback),
                  type: PageTransitionType.bottomToTop,
                  duration: const Duration(milliseconds: 150),
                  reverseDuration: const Duration(milliseconds: 150),
                  settings: settings,
                );
              case '/items/new':
                final args = settings.arguments as NewItem;

                return PageTransition(
                  child: NewItem(
                      categoryId: args.categoryId, onCallback: args.onCallback),
                  type: PageTransitionType.bottomToTop,
                  duration: const Duration(milliseconds: 150),
                  reverseDuration: const Duration(milliseconds: 150),
                  settings: settings,
                );
              case '/items/id':
                final args = settings.arguments as ItemDetail;

                return PageTransition(
                  child: ItemDetail(id: args.id, onCallback: args.onCallback),
                  type: PageTransitionType.bottomToTop,
                  duration: const Duration(milliseconds: 150),
                  reverseDuration: const Duration(milliseconds: 150),
                  settings: settings,
                );
            }

            final Uri uri = Uri.parse(settings.name ?? "");
            if (uri.pathSegments.length == 2 &&
                uri.pathSegments.first == 'categories') {
              final int? id = int.tryParse(uri.pathSegments[1]);
              return MaterialPageRoute(
                builder: (context) => Items(id: id ?? 0),
                settings: settings,
              );
            }

            return null;
          },
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
