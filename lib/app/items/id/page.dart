import 'package:flutter/material.dart';
import 'package:sampleflutter/components/appBar/common.dart';
import 'package:sampleflutter/components/button/button.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({super.key});

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  double _value = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
              child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.network(
                    'https://via.placeholder.com/150',
                    fit: BoxFit.cover,
                  ))),
          SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("  0%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 250,
                    child: Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.black.withOpacity(0.2),
                      value: _value,
                      min: 0,
                      max: 100,
                      onChanged: (double value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                  const Text("100%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              )),
          const SizedBox(
              width: 300,
              height: 60,
              child: Center(
                  child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    child: Text("ストック数",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ),
                  Flexible(
                      child: SizedBox(
                    width: 120,
                    height: 40,
                    child: Padding(
                        padding: EdgeInsets.only(left: 0, top: 20),
                        child: TextField(
                            textAlign: TextAlign.center,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              labelText: '',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ))),
                  ))
                ],
              ))),
          const SizedBox(
              width: 300,
              height: 60,
              child: Center(
                  child: Row(
                children: <Widget>[
                  SizedBox(
                      width: 150,
                      child: Text("消費期限",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold))),
                  Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: SizedBox(
                          child: Text("2021/12/31",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              )))),
                ],
              ))),
          const SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                      width: 300,
                      child: Text("MEMO",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                      width: 300,
                      height: 100,
                      child: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: TextField(
                              maxLines: null, // 複数行入力可能
                              minLines: 3,
                              cursorColor: Colors.white,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black26,
                                border: InputBorder.none,
                              )))),
                ],
              )),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Button(
              title: "保存する",
              onPressed: () => {debugPrint("保存する")},
            ),
          ))
        ],
      ),
    );
  }
}
