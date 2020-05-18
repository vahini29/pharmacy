import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/login.dart';

class Usermanagement {
  storeNewUser(FirebaseUser user, String name, String adress, context) {
    Firestore.instance.collection('users').document(user.uid).setData(
      {'email': user.email, 'uid': user.uid, 'name': name, 'address': adress},
    ).then((value) {
      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Login()));
    }).catchError((e) {
      print(e);
    });
  }
}
