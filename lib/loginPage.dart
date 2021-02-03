import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginHome(),
    );
  }
}

class LoginHome extends StatefulWidget {
  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  final _biggerFont = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
  final _buttonLoginStyle= TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black);
  final _buttonSignUpStyle= TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);
  final ButtonStyle _buttonStyle = (OutlinedButton.styleFrom(shape: StadiumBorder(), backgroundColor: Colors.white));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: _loginPage(),
    );
  }

  Widget _loginPage() {
    return SingleChildScrollView(
      child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.centerRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Text(
            "Login",
            style: _biggerFont,
          )),
          Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: new BorderRadius.all(new Radius.circular(20.0))), labelText: "E-mail"),
              )),
          SizedBox(
            height: 40,
          ),
          Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: new BorderRadius.all(new Radius.circular(20.0))), labelText: "Password"),
              )),
          SizedBox(height: 30.0,),
          SizedBox(
            width: 200.0, height: 50.0,
              child: ElevatedButton(
                style: _buttonStyle,
                child: Text(
                  "Login",
                  style: _buttonLoginStyle,
                ),
                onPressed: _loginUser,
          )),
          SizedBox(height: 20.0,),
          SizedBox(
              width: 150.0, height: 30.0,
              child: ElevatedButton(
                style: _buttonStyle,
                child: Text(
                  "Sign Up",
                  style: _buttonSignUpStyle,
                ),
                onPressed: _loginUser,
              )),
        ],
      ),
    )
    );
  }

  Future<void> _loginUser() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Work in Progress'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
