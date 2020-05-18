// import 'dart:html';

// import 'package:cartapp/screens/login.dart';
// import 'screens/sign2.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy/services/databaseuser.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  @override
  _Signupstate createState() => _Signupstate();
}

class _Signupstate extends State<Signup> {
  String email;
  String password;
  String name;
  String address;
  final _formKey = GlobalKey<FormState>();
  String error = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  AuthResult signedInUser;

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      var signedinuser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Usermanagement().storeNewUser(signedinuser.user, name, address, context);
      return 2;
    } catch (error) {
      if (error is PlatformException) {
        if (error.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          return 1;
        }
      }
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _showsnackbar() {
    final snackBar = new SnackBar(
      content: new Text('email already exist'),
      duration: new Duration(seconds: 3),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Form(
                key: _formKey,
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
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.black),
                              hintText: 'Enter your email',
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            onChanged: (value) {
                              setState(() {
                                email = value;
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
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(Icons.lock, color: Colors.black),
                              hintText: 'Enter your password',
                            ),
                            validator: (val) => val.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            onChanged: (value) {
                              setState(() {
                                password = value;
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
                          'Personal Details',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(shape: BoxShape.rectangle),
                          height: 60.0,
                          child: TextFormField(
                            controller: _nameController,
                            // obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(Icons.person_outline,
                                  color: Colors.black),
                              hintText: 'enter your name',
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'Enter valid input' : null,
                            onChanged: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(shape: BoxShape.rectangle),
                          height: 60.0,
                          child: TextFormField(
                            controller: _addressController,

                            // obscureText: true,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon:
                                  Icon(Icons.assignment, color: Colors.black),
                              hintText: 'enter your Adress',
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'Enter valid input' : null,
                            onChanged: (value) {
                              setState(() {
                                address = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await registerWithEmailAndPassword(
                              email, password);
                          if (result == 1) {
                            _showsnackbar();
                          }
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = 'Please supply a valid email';
                            });
                          }
                          if (result == 2) {
                            _emailController.clear();
                            _passwordController.clear();
                            _nameController.clear();
                            _addressController.clear();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          }
                        }
                      },
                      child: Text('SIGNUP'),
                      color: Colors.black,
                      textColor: Colors.lightBlueAccent,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}