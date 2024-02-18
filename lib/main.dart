import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sampleflutter/app/items/page.dart';
import 'package:sampleflutter/app/categories/page.dart';
import 'package:sampleflutter/app/categories/new/page.dart';
import 'package:sampleflutter/app/items/id/page.dart';

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
          title: 'Flutter Demo',
          theme: ThemeData(
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.white)),
              scaffoldBackgroundColor: Colors.brown[200]),
          home: MyHomePage(),
          routes: <String, WidgetBuilder>{
            '/items': (BuildContext context) => const Items(),
            '/items/id': (BuildContext context) => const ItemDetail(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == '/categories/new') {
              return PageTransition(
                child: CategoryNew(),
                type: PageTransitionType.bottomToTop,
                duration: const Duration(milliseconds: 150),
                reverseDuration: const Duration(milliseconds: 150),
                settings: settings,
              );
            }
            return null;
          },
        ));
  }
}
