// import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'ahomepage.dart';
// import 'package:pharmacy/item.dart';

class Alogin extends StatefulWidget {
  @override
  _Aloginstate createState() => _Aloginstate();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
_showsnackbar() {
  final snackBar = new SnackBar(
    content: new Text('Wrong Email or Password'),
    duration: new Duration(seconds: 3),
  );
  _scaffoldKey.currentState.showSnackBar(snackBar);
}

class _Aloginstate extends State<Alogin> {
  String uid = '';
  checkuser(FirebaseUser user) async {
    var f;
    try {
      await Firestore.instance
          .collection('MerchantUsers')
          .where('uid', isEqualTo: user.uid)
          .getDocuments()
          .then((value) {
        f = value.documents[0].data['uid'];
        setState(() {
          uid = f;
        });
        print(uid);
      });
    } catch (e) {
      setState(() {
        uid = '';
      });
    }
  }

  String _email;
  String _password;
  Future loginin(String email, String password) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      checkuser(user.user);
      if (uid == user.user.uid)
        return 2;
      else
        return 1;
    } catch (error) {
      return 1;
    }
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String error = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              child: Form(
                key: _formKey,
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
                          child: TextFormField(
                            controller: _passwordController,
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
                            validator: (val) => val.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
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
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          // setState(() => loading = true);
                          dynamic result = await loginin(_email, _password);
                          if (result == 1) {
                            _showsnackbar();
                          }
                          if (result == null) {
                            setState(() {
                              // loading = false;
                              error = 'Please supply a valid email';
                            });
                          }
                          if (result == 2) {
                            _emailController.clear();
                            _passwordController.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Fash()),
                            );
                          }
                        }
                      },
                      child: Text('LOGIN ADMIN'),
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
