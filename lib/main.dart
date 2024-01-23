import 'package:flutter/material.dart';
import 'package:sampleflutter/app/items/page.dart';
import 'package:sampleflutter/components/appBar/common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        home: const MyHomePage(title: 'カテゴリ画面'),
        routes: <String, WidgetBuilder>{
          '/items': (BuildContext context) => const Items(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> items = [
    {'title': 'リビング', 'subtitle': '39 ITEM'},
    {'title': 'キッチン', 'subtitle': '39 ITEM'},
    {'title': '洗面所 & トイレ', 'subtitle': '39 ITEM'},
    {'title': '玄関', 'subtitle': '39 ITEM'},
    {'title': '冷蔵庫', 'subtitle': '39 ITEM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: widget.title),
      body: ListView.builder(
        itemCount: items.length,
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
                  title: Text(items[index]['title'] ?? '',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text(items[index]['subtitle'] ?? '',
                      style: const TextStyle(color: Colors.white)),
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
