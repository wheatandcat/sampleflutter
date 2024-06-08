import 'package:flutter/material.dart';
import 'package:sampleflutter/app/items/new/page.dart';
import 'package:sampleflutter/components/icon/add.dart';

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
}
