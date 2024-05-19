import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/components/button/button.dart';
import 'package:sampleflutter/graphql/createCategory.gql.dart';
import 'package:sampleflutter/graphql/schema.graphql.dart';
import 'package:sampleflutter/components/background/background.dart';

class CategoryNew extends HookWidget {
  final void Function() onCallback;

  const CategoryNew({super.key, required this.onCallback});

  @override
  Widget build(BuildContext context) {
    final inputText = useState('');

    final mutationHookResult =
        useMutation$CreateCategory(WidgetOptions$Mutation$CreateCategory(
      onCompleted:
          (Map<String, dynamic>? data, Mutation$CreateCategory? result) async {
        onCallback();
        Navigator.pop(context);
      },
    ));

    onPressed() async {
      if (inputText.value.isEmpty) {
        return;
      }

      mutationHookResult.runMutation(Variables$Mutation$CreateCategory(
          input: Input$NewCategory(
        name: inputText.value,
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
                  const Text("カテゴリを登録する",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Center(
                      child: TextField(
                          onChanged: (value) => inputText.value = value,
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
                          child: Button(title: "登録", onPressed: onPressed))),
                ],
              )),
        ));
  }
}
