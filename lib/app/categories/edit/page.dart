import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/components/button/button.dart';
import 'package:sampleflutter/graphql/updateCategory.gql.dart';
import 'package:sampleflutter/graphql/schema.graphql.dart';
import 'package:sampleflutter/components/background/background.dart';

class CategoryEdit extends HookWidget {
  final int id;
  final String name;
  final void Function() onCallback;

  const CategoryEdit(
      {super.key,
      required this.id,
      required this.name,
      required this.onCallback});

  @override
  Widget build(BuildContext context) {
    final inputName = useTextEditingController(text: name);

    final mutationHookResult =
        useMutation$UpdateCategory(WidgetOptions$Mutation$UpdateCategory(
      onCompleted:
          (Map<String, dynamic>? data, Mutation$UpdateCategory? result) {
        onCallback();
        Navigator.pop(context);
      },
    ));

    onPressed() async {
      if (inputName.text.isEmpty) {
        return;
      }

      mutationHookResult.runMutation(Variables$Mutation$UpdateCategory(
          input: Input$UpdateCategory(
        id: id,
        name: inputName.text,
        order: 0,
      )));
    }

    return Scaffold(
        appBar: const CommonAppBar(title: ""),
        body: BackgroundImage(
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("カテゴリ名を変更する",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Center(
                      child: TextField(
                          controller: inputName,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                            labelText: '',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ))),
                  Expanded(
                      child: Center(
                          heightFactor: 3,
                          child: Button(title: "更新する", onPressed: onPressed))),
                ],
              )),
        ));
  }
}
