// import 'package:cartapp/services/profileservceedit.dart';
// import 'package:cartapp/widget/additem.dart';
import 'package:flutter/material.dart';

import 'additemwidget.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<FirebaseUser>(context);
    // return StreamProvider.value(
    //     // All children will have access to weapons data
    //     catchError: (_, __) => null,
    //     value:DatabaseeditService().userData(user),
     return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          brightness: Brightness.light,
          title: Text(
            "Foody'z",
            style: TextStyle(fontFamily: 'Pacifico', fontSize: 30),
          ),
          centerTitle: true,
          leading: AbsorbPointer(
              absorbing: true, child: Icon(Icons.save, color: Colors.white)),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
          height: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              color: Colors.black),
          child: SingleChildScrollView(
            child: AdditemWidget(),
          ),
        ),

    );
  }
}
