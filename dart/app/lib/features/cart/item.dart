import 'package:flutter/material.dart';
import 'package:stockkeeper/features/cart/itemImage.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stockkeeper/utils/style.dart';

class Item extends HookWidget {
  final int stock;
  final int? addCount;
  final String? imageURL;
  final bool? disabled;
  void Function(int) onPressed;

  Item(
      {super.key,
      this.imageURL,
      this.addCount = 0,
      this.disabled = false,
      required this.stock,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final quantity = useState<int>(addCount ?? 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        InkWell(
          child: quantity.value == 0
              ? ItemImage(imageURL: imageURL)
              : Stack(
                  children: [
                    ItemImage(imageURL: imageURL),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8.0), // 角を丸くする
                      ),
                      child: Center(
                        child: Text(
                          '+${quantity.value}',
                          style: const TextStyle(
                            fontSize: FontSize.lg,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          onTap: () {
            if (disabled == true) {
              return;
            }
            quantity.value++;
            onPressed(quantity.value);
          },
          onLongPress: () {
            if (disabled == true) {
              return;
            }

            if (quantity.value > 0) {
              quantity.value = 0;
            }
          },
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5,
                left: 30,
              ),
              child: Text(
                '$stock個',
                style: const TextStyle(
                  fontSize: FontSize.lg,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ],
    );
  }
}
