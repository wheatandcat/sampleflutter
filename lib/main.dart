import 'package:flutter/material.dart';

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
          colorScheme: ColorScheme.fromSwatch(
            brightness: Brightness.light,
            primarySwatch: Colors.purple,
            accentColor: Colors.red,
          ),
          scaffoldBackgroundColor: Colors.brown[200]),
      home: const MyHomePage(title: 'カテゴリ画面'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<Map<String, String>> items = [
    {'title': 'リビング', 'subtitle': '39 ITEM'},
    {'title': 'キッチン', 'subtitle': '39 ITEM'},
    {'title': '洗面所 & トイレ', 'subtitle': '39 ITEM'},
    {'title': '玄関', 'subtitle': '39 ITEM'},
    {'title': '冷蔵庫', 'subtitle': '39 ITEM'},
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.transparent,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.menu), // メニューアイコン
            onPressed: () {
              // ボタンが押されたときの処理
              debugPrint('Menu button pressed');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.transparent,
            elevation: 0,
            shape:
                const Border(bottom: BorderSide(color: Colors.white, width: 3)),
            child: ListTile(
              title: Text(items[index]['title'] ?? '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(items[index]['subtitle'] ?? '',
                  style: const TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: _incrementCounter,
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
