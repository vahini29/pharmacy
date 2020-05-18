import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/services/additem.dart';

//import 'package:pharmacy/first.dart';
//import 'package:pharmacy/six.dart';
//import 'package:pharmacy/two.dart';
//import 'package:pharmacy/three.dart';
//import 'package:pharmacy/four.dart';
//import 'package:pharmacy/five.dart';
// ignore: must_be_immutable
class GridLayout1 extends StatelessWidget {
  // ignore: sdk_version_set_literal
  List events = [
    "Baby Needs",
    "Personal Care",
    "Home Care",
    "Health and Nutrition",
    "Vitamins and Supplements",
    "Prescription",
  ];
  //List<Widget> screens=[
  //  First(),Second(),Third(),Four(),Five(),Six()
  // ];
  Size screenSize;
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose your category'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      endDrawer: Container(
        width: screenSize.width - 50,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Vahini"),
              accountEmail: new Text("vahi@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Icon(Icons.person),
              ),
            ),
            ListTile(
              title: new Text("Home"),
              trailing: new Icon(Icons.home),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GridLayout1())),
            ),
            ListTile(
              title: new Text("Settings"),
              trailing: new Icon(Icons.settings),
              //onTap:()=>Navigator.push(context,
              //MaterialPageRoute(builder: (context) => GridLayout1())
              //),
            ),
            ListTile(
              title: new Text("About"),
              trailing: new Icon(Icons.info),
              //onTap:()=>Navigator.push(context,
              //    MaterialPageRoute(builder: (context) => GridLayout1())
              //),
            ),
            ListTile(
              title: new Text("logout"),
              trailing: new Icon(Icons.exit_to_app),
              //onTap:()=>Navigator.push(context,
              //    MaterialPageRoute(builder: (context) => GridLayout1())
              //),
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background-1.jfif"), fit: BoxFit.cover),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 100.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              events.length,
              (int index) => GestureDetector(
                child: Card(
                  margin: const EdgeInsets.all(20.0),
                  child: getCardByTitle(events[index]),
                ),
                onTap: () {
                  // var d=screens[index];
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdditemWidget()));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column getCardByTitle(title) {
    String img = "";
    if (title == "Baby Needs") {
      img = "images/Screenshot (86).png";
    }
    if (title == "Personal Care") img = "images/personal11.jpg";
    if (title == "Home Care") img = "images/homecare.jpg";
    if (title == "Health and Nutrition") img = "images/healthndnutf.png";
    if (title == "Vitamins and Supplements") img = "images/vitamins5.png";
    if (title == "Prescription") img = "images/pillaya.jpg";
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

// GridView(
//             physics: BouncingScrollPhysics(),
//             gridDelegate:
//                 SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//             children: events.map(
//               (title) {
//                 return GestureDetector(
//                   child: Card(
//                     margin: const EdgeInsets.all(20.0),
//                     child: getCardByTitle(title),
//                   ),
//                   onTap: () {
//                     // Fluttertoast.showToast(
//                     //   msg: title + " selected",
//                     //   toastLength: Toast.LENGTH_SHORT,
//                     //   gravity: ToastGravity.CENTER,
//                     //   backgroundColor: Colors.black,
//                     //   textColor: Colors.white,
//                     //   fontSize: 16.0,
//                     // );
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => SomePage()));
//                   },
//                 );
//               },
//             ).toList(),
//           ),
