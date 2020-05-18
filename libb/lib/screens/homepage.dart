import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/s/first.dart';
import 'package:pharmacy/screens/blogin.dart';
import 'package:pharmacy/screens/cart.dart';
import 'package:pharmacy/screens/corders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharmacy/screens/profile.dart';
import 'package:pharmacy/services/profileservices.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List category = [
    "Baby Needs",
    "Personal Care",
    "Home Care",
    "Health and Nutrition",
    "Vitamins and Supplements",
    "Medicines",
  ];
  // List screens = [First(), Second(), Third(), Four(), Five(), Six()];
  FirebaseAuth _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);

    return StreamProvider.value(
        value: DatabaseeditService().userData(user),
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (c) => Cart()));
                  },
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Cart'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context, MaterialPageRoute(builder: (c) => Profile()));
                  },
                  leading: Icon(Icons.person_outline),
                  title: Text('Account Settings'),
                ),
                ListTile(
                  leading: Icon(Icons.list),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context, MaterialPageRoute(builder: (c) => Corder()));
                  },
                  title: Text(' Orders'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (f) => BLogin()));
                  },
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Log out'),
                ),
              ],
            ),
          ),
          appBar: AppBar(),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background-1.jfif"),
                  fit: BoxFit.cover),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 100.0),
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  category.length,
                  (int index) => GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.all(20.0),
                      child: getCardByTitle(category[index]),
                    ),
                    onTap: () {
                      // var d = screens[index];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => First(
                                    category: category[index],
                                  )));
                    },
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Column getCardByTitle(title) {
    String img = "";
    if (title == "Baby Needs") {
      img = "images/baby.png";
    }
    if (title == "Personal Care") img = "images/personal11.jpg";
    if (title == "Home Care") img = "images/homecare.jpg";
    if (title == "Health and Nutrition") img = "images/healthndnutf.png";
    if (title == "Vitamins and Supplements") img = "images/vitamins5.png";
    if (title == "Medicines") img = "images/pillaya.jpg";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Container(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  img,
                  width: 80.0,
                  height: 80.0,
                )
              ],
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class Third {}
