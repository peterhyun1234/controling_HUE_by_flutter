import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hue_OnOff',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'HUE LIGHT ON-OFF'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull('http://192.168.0.123:3000/temp/get_test'),
        headers: {"Accept": "application/json"});
    /print(response.body);
    List data = jsonDecode(response.body);
    //print("###");
    //print(data[1]['title']);
  }

  var light_status = 'OFF';

  void _lightOn() {
    setState(() {
      light_status = 'ON';
      //calling rest api
      getData();
    });
  }
  void _lightOff() {
    setState(() {
      light_status = 'OFF';
      //calling rest api
    });
  }

  void _additional_func() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondRoute()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0), // 전체적으로 16씩 패딩을 주었음.
        child: Column( // 세로로 위젯을 배치
          children: <Widget>[
            Text(
              "$light_status",
              style: TextStyle(fontSize: 160.0),
            ),
            Row( // 가로로 위젯을 배치, 안에 버튼 2개가 들어가 있음.
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯끼리 같은 공간만큼 띄움
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    "ON",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () { // 버튼을 누르면 안에 있는 함수를 실행
                    _lightOn();
                  },
                ),
                RaisedButton(
                  child: Text(
                    "OFF",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red, // 버튼 색은 파란색으로
                  onPressed: () { // 버튼을 누르면 안에 있는 함수를 실행
                    _lightOff();
                  },
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _additional_func,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("additional function is needed"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
