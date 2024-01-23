import 'package:flutter/material.dart';
import 'package:sampleflutter/components/appBar/common.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: ""),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              shape: Border(bottom: BorderSide(color: Colors.white, width: 3)),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("リビング",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                subtitle: Text('4 ITEM', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: List.generate(5, (index) {
                // ここで各アイテムのウィジェットを生成します。
                // ダミーデータを使用していますが、実際にはリストやデータソースからデータを取得します。
                return Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Image.network(
                          'https://via.placeholder.com/150',
                          fit: BoxFit.cover,
                        ), // 画像URLを指定
                      ),
                      const Padding(
                        padding: EdgeInsets.zero,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('100%',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 20),
                              Text('使用期限\n2021/12/31',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)),
                            ]), // 期限日
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
