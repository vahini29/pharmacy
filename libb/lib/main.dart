import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/blogin.dart';
import 'services/cartdetails.dart';
// import 'package:pharmacy/blogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Make user stream available
        StreamProvider<FirebaseUser>.value(
            value: FirebaseAuth.instance.onAuthStateChanged),
      ],
      child:  ChangeNotifierProvider<CartDetails>(
        create: (context) => CartDetails(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
           
            primarySwatch: Colors.blue,
         
           // visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: BLogin(),
        ),
      ),
    );
  }
}

