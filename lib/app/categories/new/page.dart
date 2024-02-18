import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/components/button/button.dart';
import 'package:sampleflutter/graphql/createCategory.gql.dart';
import 'package:sampleflutter/graphql/schema.graphql.dart';

class CategoryNew extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = useTextEditingController();

    final mutationHookResult =
        useMutation$CreateCategory(WidgetOptions$Mutation$CreateCategory(
      onCompleted:
          (Map<String, dynamic>? data, Mutation$CreateCategory? result) async {
        debugPrint(result?.createCategory.id);
      },
    ));

    onPressed() async {
      if (textController.text.isEmpty) {
        return;
      }

      mutationHookResult.runMutation(Variables$Mutation$CreateCategory(
          input: Input$NewCategory(
        name: textController.text,
        order: 0,
      )));
    }

    return Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Padding(
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
                      controller: textController,
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
    );
  }
}
