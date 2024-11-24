import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:stockkeeper/features/cart/page.dart';
import 'package:stockkeeper/features/cart/createList.dart';

@widgetbook.UseCase(name: 'Default', type: CartPage)
Widget buildCartPageUseCase(BuildContext context) {
  return CartPage(
    categoryItems: [
      CategoryItem(
        'リビング',
        [
          CategoryItemDetail(
            id: '1',
            categoryId: '1',
            stock: 1,
            imageURL:
                'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/category%2Fcategory%252Fea2dfc93-c5c1-40e3-8f45-329dbe5960fd.jpg%257D%3Falt%3Dmedia%26token%3Dec2e0d6d-a9e5-4fec-b2bf-cbdefb9a9ead?alt=media&token=57e22e03-80be-463a-966a-15017a6b7fb4',
          ),
        ],
      ),
      CategoryItem(
        'ダイニング',
        [
          CategoryItemDetail(
            id: '2',
            categoryId: '2',
            stock: 2,
            imageURL:
                'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/category%2Fcategory%252Fea2dfc93-c5c1-40e3-8f45-329dbe5960fd.jpg%257D?alt=media&token=743b729e-dceb-48e4-8ece-c54a2ad8bc4b',
          ),
          CategoryItemDetail(
            id: '3',
            categoryId: '2',
            stock: 3,
            imageURL:
                'https://firebasestorage.googleapis.com/v0/b/stock-keeper-review.appspot.com/o/category%2F04f00fc3-102d-4756-aa86-87d58552dd20.jpg%7D?alt=media&token=e2d4c670-a06a-4714-90f7-67b4b48e13ae',
          ),
        ],
      ),
    ],
    onBuying: () {},
  );
}
