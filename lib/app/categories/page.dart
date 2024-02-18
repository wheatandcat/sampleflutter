import 'package:flutter/material.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/graphql/categories.gql.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/utils/graphql.dart';

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final queryResult = useQuery$Categories(Options$Query$Categories());

    final result = queryResult.result;

    final List<Query$Categories$categories> categories = extractGraphQLData(
      data: result.data,
      fieldName: "categories",
      fromJson: Query$Categories$categories.fromJson,
    );

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
          Navigator.pushNamed(context, '/categories/new');
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
