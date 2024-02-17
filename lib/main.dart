import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sampleflutter/app/items/page.dart';
import 'package:sampleflutter/app/items/id/page.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/graphql/categories.gql.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
                colorScheme: ColorScheme.fromSwatch(
                  brightness: Brightness.light,
                  primarySwatch: Colors.purple,
                  accentColor: Colors.red,
                ),
                scaffoldBackgroundColor: Colors.brown[200]),
            home: MyHomePage(),
            routes: <String, WidgetBuilder>{
              '/items': (BuildContext context) => const Items(),
              '/items/id': (BuildContext context) => const ItemDetail(),
            }));
  }
}

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final queryResult = useQuery$Categories(Options$Query$Categories());

    final result = queryResult.result;

    if (result.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (result.hasException) {
      return Text(result.exception.toString());
    }
    final data = result.data;
    if (data == null || data.isEmpty) {
      return const Text('データがありません');
    }

    final List<Query$Categories$categories> categories = (data["categories"]
            as List<dynamic>)
        .map((item) =>
            Query$Categories$categories.fromJson(item as Map<String, dynamic>))
        .toList();

    return Scaffold(
      appBar: const CommonAppBar(title: "カテゴリ画面"),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/items');
              },
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                shape: const Border(
                    bottom: BorderSide(color: Colors.white, width: 3)),
                child: ListTile(
                  title: Text(categories[index].name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  subtitle: const Text("39 ITEMS",
                      style: TextStyle(color: Colors.white)),
                ),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          debugPrint('Floating action button pressed');
        },
        tooltip: 'Increment',
        child: Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(2), // ボーダーの幅を調整
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              border: Border(
                top: BorderSide(color: Colors.white, width: 4),
                bottom: BorderSide(color: Colors.white, width: 4),
                left: BorderSide(color: Colors.white, width: 4),
                right: BorderSide(color: Colors.white, width: 4),
              )),
          child: const CircleAvatar(
            radius: 12,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
