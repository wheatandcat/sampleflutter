import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sampleflutter/utils/style.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sampleflutter/components/background/background.dart';
import 'package:sampleflutter/components/category/list.dart';
import 'package:sampleflutter/components/category/menu.dart';
import 'package:sampleflutter/components/icon/add.dart';
import 'package:sampleflutter/components/item/card.dart';
import 'package:sampleflutter/components/category/card.dart';
import 'package:sampleflutter/graphql/categories.gql.dart';
import 'package:sampleflutter/graphql/category.gql.dart';
import 'package:sampleflutter/graphql/deleteCategory.gql.dart';
import 'package:sampleflutter/graphql/deleteItem.gql.dart';
import 'package:sampleflutter/utils/graphql.dart';
import 'package:sampleflutter/app/categories/new/page.dart';
import 'package:sampleflutter/providers/user.dart';
import 'package:sampleflutter/providers/graphql.dart';
import 'package:sampleflutter/app/items/new/page.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.read(graphqlClientProvider);

    final selectCategoryId = useState<int>(0);
    final items = useState<List<Query$Category$items>>([]);

    final qcrs = useQuery$Categories(Options$Query$Categories(
        onComplete: (Map<String, dynamic>? data, Query$Categories? result) {
      debugPrint('onComplete');
      List<Query$Categories$categories?> categories = result?.categories ?? [];
      if (categories.isNotEmpty) {
        selectCategoryId.value = int.tryParse(categories[0]?.id ?? '0')!;
      }
    }));

    final userDataAsyncValue = ref.watch(userDataProvider);
    debugPrint('userDataAsyncValue: ${userDataAsyncValue.asData?.value?.id}');

    Future<void> getItems(int categoryId) async {
      final result = await client.query<Query$Category>(
        QueryOptions(
          document: documentNodeQueryCategory,
          fetchPolicy: FetchPolicy.networkOnly,
          variables: <String, dynamic>{
            'id': categoryId,
          },
        ),
      );
      if (result.hasException) {
        return;
      }

      items.value = extractGraphQLDataList(
        data: result.data,
        fieldName: "items",
        fromJson: Query$Category$items.fromJson,
      );
    }

    useEffect(() {
      getItems(selectCategoryId.value);
      return null;
    }, [selectCategoryId.value]);

    final List<Query$Categories$categories> categories = extractGraphQLDataList(
      data: qcrs.result.data,
      fieldName: "categories",
      fromJson: Query$Categories$categories.fromJson,
    );

    final mhdcr =
        useMutation$DeleteCategory(WidgetOptions$Mutation$DeleteCategory(
      onCompleted:
          (Map<String, dynamic>? data, Mutation$DeleteCategory? result) {
        Navigator.of(context).pop();
        qcrs.refetch();
      },
    ));

    final mhdir = useMutation$DeleteItem(WidgetOptions$Mutation$DeleteItem(
      onCompleted: (Map<String, dynamic>? data, Mutation$DeleteItem? result) {
        getItems(selectCategoryId.value);
      },
    ));

    void showCustomMenu(
        BuildContext context, Query$Categories$categories category) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CategoryMenu(
              id: category.id,
              name: category.name,
              onEditCallback: () => {qcrs.refetch()},
              onDelete: (categoryId) {
                mhdcr.runMutation(Variables$Mutation$DeleteCategory(
                  id: int.tryParse(category.id) ?? 0,
                ));
              });
        },
      );
    }

    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    String categoryName = '';
    if (categories.isNotEmpty) {
      categoryName = categories
          .firstWhere(
              (element) => element.id == selectCategoryId.value.toString())
          .name;
    }

    return BackgroundImage(
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryList(
              categories: categories,
              onAdd: () => {
                Navigator.pushNamed(context, '/categories/new',
                    arguments: CategoryNew(onCallback: () {
                  qcrs.refetch();
                }))
              },
              onPassedItem: (categoryId) {
                selectCategoryId.value = categoryId;

                //Navigator.pushNamed(context, '/categories/$categoryId');
              },
              onLongPressedItem: (category) {
                showCustomMenu(context, category);
              },
            ),
            Container(
              width: deviceWidth - 100,
              height: deviceHeight,
              color: Colors.transparent,
              margin: const EdgeInsets.symmetric(vertical: AppSpacing.large),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CategoryCard(name: categoryName)),
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        padding: const EdgeInsets.all(10),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        children:
                            List.generate(items.value.length + 1, (index) {
                          if (index == items.value.length) {
                            return Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, left: 5, bottom: 28),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/items/new',
                                        arguments: NewItem(
                                          categoryId: selectCategoryId.value,
                                          onCallback: () {
                                            getItems(selectCategoryId.value);
                                          },
                                        ));
                                  },
                                  child: const Card(
                                    color: Colors.black45,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0))),
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
                                ));
                          }

                          final item = items.value[index];

                          return Container(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: ItemCard(
                                id: item.id,
                                name: item.name,
                                stock: item.stock,
                                expirationDate: item.expirationDate,
                                onRefetch: () {
                                  getItems(selectCategoryId.value);
                                },
                                onDelete: () {
                                  mhdir.runMutation(
                                      Variables$Mutation$DeleteItem(
                                    id: int.tryParse(item.id) ?? 0,
                                  ));
                                },
                              ));
                        })),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
