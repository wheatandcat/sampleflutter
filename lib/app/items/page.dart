import 'package:flutter/material.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/graphql/category.gql.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/utils/graphql.dart';

class Items extends HookWidget {
  final int id;

  const Items({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final queryResult = useQuery$Category(
        Options$Query$Category(variables: Variables$Query$Category(id: id)));

    final result = queryResult.result;

    if (result.isLoading) {
      return const Scaffold(
        appBar: CommonAppBar(title: ""),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final Query$Category$category category = extractGraphQLData(
      data: result.data,
      fieldName: "category",
      fromJson: Query$Category$category.fromJson,
    );

    return Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              shape: const Border(
                  bottom: BorderSide(color: Colors.white, width: 3)),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(category.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                subtitle:
                    const Text('4 ITEM', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: List.generate(5, (index) {
                // ここで各アイテムのウィジェットを生成します。
                // ダミーデータを使用していますが、実際にはリストやデータソースからデータを取得します。
                return InkWell(
                    onTap: () => Navigator.pushNamed(context, '/items/id'),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            child: Image.network(
                              'https://via.placeholder.com/150',
                              fit: BoxFit.cover,
                            ), // 画像URLを指定
                          ),
                          const Padding(
                            padding: EdgeInsets.zero,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('100%',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 20),
                                  Text('使用期限\n2021/12/31',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white)),
                                ]), // 期限日
                          ),
                        ],
                      ),
                    ));
              }),
            ),
          ),
        ],
      ),
    );
  }
}
