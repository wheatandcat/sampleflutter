import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stockkeeper/app/items/new/page.dart';
import 'package:stockkeeper/components/icon/add.dart';
import 'package:stockkeeper/features/category/components/addItemMenu.dart';

class CategoryNewItem extends StatelessWidget {
  final int categoryId;
  final void Function() onCallback;

  const CategoryNewItem(
      {super.key, required this.categoryId, required this.onCallback});

  @override
  Widget build(BuildContext context) {
    void showMenu(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return AddItemMenu(onBarcode: () {
            context.push('/items/new',
                extra: NewItem(
                  scanBarcode: true,
                  categoryId: categoryId,
                  onCallback: () {
                    onCallback();
                  },
                ));
          }, onAdd: () {
            context.push('/items/new',
                extra: NewItem(
                  scanBarcode: false,
                  categoryId: categoryId,
                  onCallback: () {
                    onCallback();
                  },
                ));
          });
        },
      );
    }

    return InkWell(
      onTap: () {
        showMenu(context);
      },
      child: const Card(
        color: Colors.black45,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AddIcon(),
            ],
          ),
        ),
      ),
    );
  }
}
