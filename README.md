# controling_HUE_by_flutter
## 1. application UI in android
![onoff_flutter](https://user-images.githubusercontent.com/46476398/71763226-de192100-2f1c-11ea-9baf-81da2453bcc4.jpg)
### 2. Buttons
### 2.1. ON-OFF button
```dart
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
```
### 2.2. Additional function button
```dart
      floatingActionButton: FloatingActionButton(
        onPressed: _additional_func,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
```
----------------------------------------
## 3. Calling REST API
```dart
           Future<String> getData() async {
             var response = await http.get(
                 Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
                 headers: {"Accept": "application/json"});
             setState(() {
               data = json.decode(response.body);
             });
             return "Success";
           }
```
----------------------------------------
## 4. contact
    e-mail: peterhyun1234@gmail.com
