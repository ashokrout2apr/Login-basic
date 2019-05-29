import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String welcomeString="";

  void _erase(){
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }
  void _showWelcome(){
    setState(() {
      if(_userController.text.isNotEmpty
          && _passwordController.text.isNotEmpty) {

        welcomeString = _userController.text;

      }
      else
        welcomeString = "Nothing";
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("LOGIN"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),

      body: new Container(
        alignment: Alignment.topCenter,
        child: new Column(
          children: <Widget>[
            //image//profile
            new Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.grey.shade700,
            ),
            new Padding(
                padding: new EdgeInsets.all(10.5)), //add padding to form

            //FORM
            new Container(
              height: 180.0,
              width: 380.0,
              color: Colors.blue.shade100,
              child: new Column(children: <Widget>[
                new TextField(
                  controller: _userController,
                  decoration: new InputDecoration(
                    hintText: 'Username',
                    icon: new Icon(Icons.person),
                  ),
                ),
                new TextField(
                  controller: _passwordController,
                  decoration: new InputDecoration(
                    hintText: 'Password',
                    icon: new Icon(Icons.lock),
                  ),
                ),

                new Padding(
                    padding: new EdgeInsets.all(10.5)), //add padding to button

                new Center(
                  child: new Row(
                    children: <Widget>[
                      //Login Button
                      new Container(
                        margin: const EdgeInsets.only(left: 38.0),
                        child: new RaisedButton(
                            onPressed: _showWelcome ,
                            color: Colors.redAccent,
                            child: new Text("LOGIN",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 17.0))),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(left: 120.0),
                        child: new RaisedButton(
                            onPressed: _erase,
                            color: Colors.redAccent,
                            child: new Text("CLEAR",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 17.0))),
                      )
                    ],
                  ),
                ),
              ]),
            ), //form ends here.

            new Padding(
                padding: new EdgeInsets.all(15.0)), //add padding to text

            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "WELCOME!!! $welcomeString",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
