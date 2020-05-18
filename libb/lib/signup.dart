import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:pharmacy/gridlayout.dart';
//import 'package:pharmacy/usermanagement.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'services/usermanagement.dart';

class Signuppage extends StatefulWidget {
  @override
  _Signuppagestate createState() => _Signuppagestate();
}

class _Signuppagestate extends State<Signuppage> {
  String _email;
  String _password;
  //String _cpassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIGNUP'),
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(
                  color: Color(0xFFB3E5FC),
                  image: DecorationImage(
                      fit: BoxFit.fill,
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
                padding:
                    EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign Up ',
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
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.black),
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
                              prefixIcon: Icon(Icons.lock, color: Colors.black),
                              hintText: 'Enter your password',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _password = value;
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
                          'Confirm Password',
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
                              prefixIcon: Icon(Icons.lock, color: Colors.black),
                              hintText: 'Confirm your password',
                            ),
                            onChanged: (value) {
                              setState(() {
                                // _cpassword=value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    RaisedButton(
                      onPressed: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _email, password: _password)
                            .then(
                          (signedinuser) {
                            Usermanagement()
                                .storeNewUser(signedinuser, context);
                          },
                        ).catchError(
                          (e) {
                            print(e); //Navigator.push(context,
                            //MaterialPageRoute(builder: (context) => GridLayout()));},
                          },
                        );
                      },
                      child: Text('SIGNUP'),
                      color: Colors.black,
                      textColor: Colors.lightBlueAccent,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
