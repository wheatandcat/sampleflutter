import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sampleflutter/utils/style.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/components/background/background.dart';
import 'package:sampleflutter/features/category/components/list.dart';
import 'package:sampleflutter/features/category/components/menu.dart';
import 'package:sampleflutter/graphql/categories.gql.dart';
import 'package:sampleflutter/graphql/deleteCategory.gql.dart';
import 'package:sampleflutter/graphql/deleteItem.gql.dart';
import 'package:sampleflutter/utils/graphql.dart';
import 'package:sampleflutter/app/categories/new/page.dart';
import 'package:sampleflutter/providers/user.dart';
import 'package:sampleflutter/features/category/hooks/useItems.dart';
import 'package:sampleflutter/features/category/components/items.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = useItems(ref);

    final selectCategoryId = useState<int>(0);

    final qcrs = useQuery$Categories(Options$Query$Categories(
        onComplete: (Map<String, dynamic>? data, Query$Categories? result) {
      List<Query$Categories$categories?> categories = result?.categories ?? [];
      if (categories.isNotEmpty) {
        selectCategoryId.value = int.tryParse(categories[0]?.id ?? '0')!;
      }
    }));

    final userDataAsyncValue = ref.watch(userDataProvider);
    debugPrint('userDataAsyncValue: ${userDataAsyncValue.asData?.value?.id}');

    useEffect(() {
      items.get(selectCategoryId.value);
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
        items.get(selectCategoryId.value);
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
              categoryId: selectCategoryId.value,
              categories: categories,
              onAdd: () => {
                Navigator.pushNamed(context, '/categories/new',
                    arguments: CategoryNew(onCallback: () {
                  qcrs.refetch();
                }))
              },
              onPassedItem: (categoryId) {
                selectCategoryId.value = categoryId;
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
              child: categories.isEmpty
                  ? const SafeArea(
                      child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            'まずは部屋を作りましょう！\n左の＋マークを\nタップしてください。',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )))
                  : CategoryItems(
                      categoryId: selectCategoryId.value,
                      categoryName: categoryName,
                      items: items.value,
                      onNewItem: () {
                        items.get(selectCategoryId.value);
                      },
                      onRefetch: () {
                        items.get(selectCategoryId.value);
                      },
                      onDelete: (int itemId) {
                        mhdir.runMutation(Variables$Mutation$DeleteItem(
                          id: itemId,
                        ));
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
