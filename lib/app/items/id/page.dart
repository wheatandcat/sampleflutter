import 'package:flutter/material.dart';
import 'package:sampleflutter/components/appBar/common.dart';

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
                  width: 300,
                  height: 300,
                  child: Image.network(
                    'https://via.placeholder.com/150',
                    fit: BoxFit.cover,
                  ))),
          SizedBox(
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
          const Expanded(
              child: Center(
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("ストック数 ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              Flexible(
                child: SizedBox(
                    width: 100,
                    height: 30,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white, fontSize: 24),
                        decoration: InputDecoration(labelText: ''))),
              )
            ],
          ))),
        ],
      ),
    );
  }
}
