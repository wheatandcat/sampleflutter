import 'package:flutter/material.dart';
import 'package:stockkeeper/features/cart/itemImage.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Item extends HookWidget {
  final int stock;
  final String? imageURL;

  const Item({super.key, this.imageURL, required this.stock});

  @override
  Widget build(BuildContext context) {
    final quantity = useState<int>(0);

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
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          onTap: () {
            quantity.value++;
          },
          onLongPress: () {
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
                '${stock}個',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )),
      ],
    );
  }
}
