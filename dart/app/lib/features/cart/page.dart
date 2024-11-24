import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/features/cart/createList.dart';
import 'package:stockkeeper/components/button/button.dart';
import 'package:stockkeeper/features/cart/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:stockkeeper/utils/style.dart';

class CartPage extends HookWidget {
  final List<CategoryItem> categoryItems;
  final void Function() onBuying;

  const CartPage({
    super.key,
    required this.categoryItems,
    required this.onBuying,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: Spacing.xl2),
          // ボタンの高さ分のパディングを追加
          child: ListView.builder(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, bottom: Spacing.xl2),
            itemCount: categoryItems.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: Spacing.md),
                    child: Text(
                      categoryItems[index].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: FontSize.lg,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.only(top: Spacing.xl),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                    itemCount: categoryItems[index].items.length,
                    itemBuilder: (context, index2) {
                      final item = categoryItems[index].items[index2];
                      return Item(
                        disabled: true,
                        addCount: item.addCount,
                        stock: item.stock,
                        imageURL: item.imageURL,
                        onPressed: (int stock) => {},
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.bg, width: BorderWidth.sm),
              ),
              image: DecorationImage(
                image: AssetImage('images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            height: 120,
            padding: const EdgeInsets.only(bottom: Spacing.md),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Button(
                    title: "買い物完了！",
                    onPressed: onBuying,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: Spacing.md),
                    child: Text(
                      "ストックに追加されます",
                      style: TextStyle(
                        fontSize: FontSize.sm,
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
