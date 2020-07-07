import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget input = Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: '请输入用户名',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: '请输入密码',
              ),
            ),
          ],
        ));

    Widget loginBtn = Container(
        alignment: Alignment.center,
        child: RaisedButton(
            child: Text("登录"),
            onPressed: () {},
            textColor: Colors.white,
            color: Colors.lightBlue,
            highlightColor: Colors.yellow,
            disabledTextColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )));
    return MaterialApp(
        home: Scaffold(
            body: ListView(
      children: [Head(), input, loginBtn],
    )));
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "请输入账号",
              labelStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginData {
  String _account;
  String _passWord;

  _LoginData(this._account, this._passWord);
}

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Image(
                image: AssetImage('assets/images/login.png'),
                width: 60,
                height: 60,
              )),
          Text(
            "您好,",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          Text(
            "欢迎来到智能计量开关APP,",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
