import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:pharmacy/services/ex.dart';
//import 'package:pharmacy/gridlayout.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:pharmacy/services/ex.dart';
//import 'package:pharmacy/services/adminpage.dart';
class Aloginpage extends StatefulWidget {
  @override
  _Aloginpagestate createState() => _Aloginpagestate();
}

class _Aloginpagestate extends State<Aloginpage> {
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN ADMIN'),
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(
                  color: Color(0xFFB3E5FC),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Color(0xFFB3E5FC).withOpacity(0.2),
                          BlendMode.dstATop),
                      image: AssetImage('images/hospital-logo.png'))),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0.8, 0.0),
                colors: [const Color(0xFFCFD8DC), const Color(0xFFCFD8DC)],
              ))),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Login ',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(shape: BoxShape.rectangle),
                        height: 60.0,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(Icons.email, color: Colors.black),
                            hintText: 'Enter your email',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(shape: BoxShape.rectangle),
                        height: 60.0,
                        child: TextField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            hintText: 'Enter your password',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () =>
                              print('Forgot Password button pressed'),
                          child: Text('Forgot Password'),
                        ),
                      )
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((user) {
                        Navigator.of(context)
                            .pushReplacementNamed('/gridpage1');
                      }).catchError((e) {
                        print(e);
                      });
                    },
                    //Navigator.push(context,;
                    // MaterialPageRoute(builder: (context) => GridLayout()));},
                    child: Text('LOGIN ADMIN'),
                    color: Colors.black,
                    textColor: Colors.lightBlueAccent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
