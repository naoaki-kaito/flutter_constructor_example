import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Constructor Demo',
      home: Scaffold(
          appBar: AppBar(
            title: Text('メンバーリスト'),
          ),
          body: Column(
            children: <Widget>[
              MemberCard.normal(name: '鈴木 たかし', imgFileName: 'avator1.png'),
              MemberCard.disabled(name: '高橋 ゆうさく', imgFileName: 'avator2.png'),
              MemberCard.normal(name: 'Sarah Adams', imgFileName: 'avator3.jpeg'),
              MemberCard.normal(name: 'Richard Mason', imgFileName: 'avator4.jpeg'),
            ],
          )

      ),
    );
  }
}

class MemberCard extends StatefulWidget {
  final String name; //名前
  final String imgFileName; //アバター画像
  final Color backgroundColor; //背景色
  final statusIcon; //メンバーのステータス

  // 通常のユーザー
  MemberCard.normal({name, imgFileName})
      : this._init(
        name: name,
        imgFileName: imgFileName,
        statusIcon: Icon(Icons.check_circle, color: Colors.green,)
      );

  // 退会したユーザー
  MemberCard.disabled({name, imgFileName})
      : this._init(
      name: name,
      imgFileName: imgFileName,
      backgroundColor: Colors.black12,
      statusIcon: Text('退会済み')
  );

  MemberCard._init({Key key,
    this.name = '',
    this.imgFileName = '',
    this.backgroundColor = Colors.white,
    this.statusIcon = null
  }) : super(key: key);

  @override
  _MemberCardState createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.backgroundColor,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            'images/${widget.imgFileName}',
            width: 50,
            height: 50,
          ),
        ),
        title: Text(widget.name),
        trailing: widget.statusIcon,
      ),
    );
  }
}
