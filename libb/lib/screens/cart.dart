import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/services/database.dart';
import 'package:pharmacy/services/profileservices.dart';
// import 'package:pharmacy/services/database.dart';
import '../services/cartdetails.dart';
import '../screens/cartuiitems.dart';
import 'package:provider/provider.dart';

class Utils {
  final Random _random = Random.secure();

  String createCryptoRandomString([int length = 10]) {
    var values = List<int>.generate(length, (i) => _random.nextInt(256));

    return base64Url.encode(values);
  }
}

class Cart extends StatefulWidget {
  Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var user1 = Provider.of<FirebaseUser>(context);

    return StreamProvider.value(
        value: DatabaseeditService().userData(user1), child: V());
  }
}

class V extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return R();
  }
}

class R extends StatefulWidget {
  @override
  _RState createState() => _RState();
}

class _RState extends State<R> {
  final _formKey = GlobalKey<FormState>();
  String address;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var f = Provider.of<CartDetails>(context);
    var user = Provider.of<FirebaseUser>(context);
    List<String> item = f.name;
    List<int> count = f.countno;
    int total = f.getTotal;
    List<CartItems> s = f.items;
    var userd = Provider.of<ProfileUserData>(context);

    return Scaffold(
      key: _scaffoldKey,
      drawerDragStartBehavior: DragStartBehavior.down,
      // appBar: AppBar(
      //   elevation: 0,
      //   brightness: Brightness.light,
      //   title: Text(
      //     "Foody'z",
      //     style: TextStyle(fontFamily: 'Pacifico', fontSize: 30),
      //   ),
      //   centerTitle: true,
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 12),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        'CART',
                        style: TextStyle(
                          color: Colors.white,
                          // letterSpacing: 1,
                          fontSize: 25,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(
                        flex: 9,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment(0, 1),
                    child: f.items.length == 0
                        ? Center(
                            child: Text(
                              'No items yet',
                              style:
                                  TextStyle(fontSize: 50, color: Colors.white),
                            ),
                          )
                        : F()),
                // child:F()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.black,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Total:',
                          style: TextStyle(
                              fontSize: 22,
                              color: Color.fromRGBO(255, 255, 255, 0.72)),
                        ),
                        Text(
                          '\R\s $total',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        Spacer(),
                        if (total != 0) ...[
                          InkWell(
                            splashColor: Color.fromRGBO(15, 219, 72, 0.69),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: <Widget>[
                                              Text('Add address'),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                    hintText: 'add address'),
                                                validator: (val) => val.isEmpty
                                                    ? 'Enter an email'
                                                    : null,
                                                onChanged: (value) {
                                                  setState(() {
                                                    address = value;
                                                  });
                                                },
                                              ),
                                              new Checkbox(
                                                activeColor: Colors.green,
                                                onChanged: (bool newValue) {
                                                  setState(() {});
                                                  Text('cash on delivery');
                                                },
                                                value: null,
                                              ),
                                              new Checkbox(
                                                activeColor: Colors.green,
                                                onChanged: (bool newValue) {
                                                  setState(() {});
                                                  Text('paytm');
                                                },
                                                value: null,
                                              ),
                                              new Checkbox(
                                                activeColor: Colors.green,
                                                onChanged: (bool newValue) {
                                                  setState(() {});
                                                  Text('google pay');
                                                },
                                                value: null,
                                              ),
                                              new Checkbox(
                                                activeColor: Colors.green,
                                                onChanged: (bool newValue) {
                                                  setState(() {});
                                                  Text('phone pay');
                                                },
                                                value: null,
                                              ),
                                              RaisedButton(
                                                  child: Text('order'),
                                                  onPressed: () {
                                                    if (_formKey.currentState
                                                        .validate()) {
                                                      DatabaseService().storeOrder(
                                                          address: address,
                                                          item: item,
                                                          price: total,
                                                          count: count,
                                                          orderID: Utils()
                                                              .createCryptoRandomString(),
                                                          user: user,
                                                          s: s);
                                                      f.cler();
                                                      Navigator.pop(context);
                                                    }
                                                  })
                                            ],
                                          ),
                                        ),
                                      ));
                            },
                            child: Container(
                              width: width / 2.3,
                              height: 50,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Color(0xFF0FDB48),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Center(
                                  child: Text('Order Now',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold))),
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
