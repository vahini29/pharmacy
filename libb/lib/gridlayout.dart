
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/first.dart';
import 'package:pharmacy/six.dart';
import 'package:pharmacy/two.dart';
import 'package:pharmacy/three.dart';
import 'package:pharmacy/four.dart';
import 'package:pharmacy/five.dart';
// ignore: must_be_immutable
class GridLayout extends StatelessWidget {
  // ignore: sdk_version_set_literal
  List events = [
    "Baby Needs",
    "Personal Care",
    "Home Care",
    "Health and Nutrition",
    "Vitamins and Supplements",
    "Medicines",
  ];
  List<Widget> screens=[
    First(),Second(),Third(),Four(),Five(),Six()
  ];

  Widget build(BuildContext context) {
    return Scaffold(
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
              events.length,(int index)=>GestureDetector(
              child: Card(
                margin: const EdgeInsets.all(20.0),
                child: getCardByTitle(events[index]),
              ),
              onTap: () {
                var d=screens[index];
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => d));
              },
            ),

            ),
          ),
        ),
      ),);
  }

  Column getCardByTitle(title) {
    String img = "";
    if (title == "Baby Needs") {
      img = "image/baby.png";
    }
    if (title == "Personal Care") img = "image/personal11.jpg";
    if (title == "Home Care") img = "image/homecare.jpg";
    if (title == "Health and Nutrition") img = "image/healthndnutf.png";
    if (title == "Vitamins and Supplements") img = "image/vitamins5.png";
    if (title == "Medicines") img = "image/pillaya.jpg";
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