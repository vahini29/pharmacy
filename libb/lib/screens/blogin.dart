import 'login.dart';


import 'package:flutter/material.dart';

import 'signup.dart';

class BLogin extends StatefulWidget {
  BLogin({Key key}) : super(key: key);

  @override
  _BLoginState createState() => _BLoginState();
}

class _BLoginState extends State<BLogin> {
  Color lColor = Colors.orangeAccent, rColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    // var user=Provider.of<User>(context);
   return Scaffold(
      appBar: AppBar(
        title: Text('WELCOME'),
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            child: Image(
              image: AssetImage('images/login.png'),
              height: 700,
              width: 800,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: FractionalOffset(0.5, 0.8),
            child: RaisedButton(
                highlightElevation: 8,
                child: Text('LOGIN'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                color: Colors.redAccent,
                textColor: Colors.white),
          ),
          Align(
              alignment: FractionalOffset(0.5, 0.9),
              child: RaisedButton(
                highlightElevation: 8,
                child: Text('SIGN UP'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                color: Colors.redAccent,
                textColor: Colors.white,
              )),
        ],
      ),
    );
  }
}
