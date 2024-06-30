import 'package:flutter/material.dart';
import 'package:stockkeeper/components/icon/add.dart';

class ItemAddButton extends StatelessWidget {
  final void Function() onAdd;

  const ItemAddButton({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onAdd();
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
