import 'package:flutter/material.dart';
import 'package:stockkeeper/app/items/new/page.dart';
import 'package:stockkeeper/components/icon/add.dart';

class CategoryNewItem extends StatelessWidget {
  final int categoryId;
  final void Function() onCallback;

  const CategoryNewItem(
      {super.key, required this.categoryId, required this.onCallback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/items/new',
            arguments: NewItem(
              categoryId: categoryId,
              onCallback: () {
                onCallback();
              },
            ));
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
