import 'package:flutter/material.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/components/icon/add.dart';
import 'package:sampleflutter/components/category/card.dart';
import 'package:sampleflutter/graphql/category.gql.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/utils/graphql.dart';
import 'package:sampleflutter/app/items/new/page.dart';
import 'package:sampleflutter/app/items/id/page.dart';
import 'package:intl/intl.dart';

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

    final List<Query$Category$items> items = extractGraphQLDataList(
      data: result.data,
      fieldName: "items",
      fromJson: Query$Category$items.fromJson,
    );

    return Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CategoryCard(name: category.name, count: items.length)),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: List.generate(items.length + 1, (index) {
                if (index == items.length) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/items/new',
                          arguments: NewItem(
                            categoryId: id,
                            onCallback: () {
                              queryResult.refetch();
                            },
                          ));
                    },
                    child: const Card(
                      color: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Cardの角を直角にする
                      ),
                      elevation: 0,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              AddIcon(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }

                final item = items[index];

                String expirationDate = '';

                if (item.expirationDate != null) {
                  expirationDate = DateFormat('yyyy/MM/DD')
                      .format(DateTime.parse(item.expirationDate ?? ''));
                }

                return InkWell(
                    onTap: () => Navigator.pushNamed(context, '/items/id',
                        arguments: ItemDetail(
                            id: int.parse(item.id),
                            onCallback: () {
                              queryResult.refetch();
                            })),
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
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('${item.stock}%',
                                      style: const TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 20),
                                  if (item.expirationDate != null)
                                    Text('使用期限\n$expirationDate',
                                        style: const TextStyle(
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
