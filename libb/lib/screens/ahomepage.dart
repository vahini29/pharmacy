import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/services/database.dart';

import 'additem.dart';
import 'edititem.dart';
import 'orders.dart';

class Fash extends StatefulWidget {
  @override
  _FashState createState() => _FashState();
}

bool isEdit = false;

class _FashState extends State<Fash> {
  deleteDiaglog(BuildContext context, String id) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Delete',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(
              'Are you Sure You Want To Delete',
              style: TextStyle(
                letterSpacing: -1,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await DatabaseService().delete(id);
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // _showsnackbar();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('item').snapshots(),
          builder: (context, snapshot) {
            final item = snapshot.data.documents;
            try {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onLongPress: () {
                        //  index[index].fname;
                        deleteDiaglog(context, item[index]['id']);
                      },
                      onTap: () {
                        isEdit
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => Additem1Widget(
                                          item: item[index],
                                        )))
                            : print('j');
                      },
                      child: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: double.infinity,
                              child: FittedBox(
                                child: Material(
                                  color: Colors.white,
                                  elevation: 12,
                                  borderRadius: BorderRadius.circular(24.0),
                                  shadowColor: Color(0x802196f3),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 200,
                                        height: 150,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          child: Image(
                                              fit: BoxFit.contain,
                                              alignment: Alignment.topRight,
                                              image: NetworkImage(
                                                  item[index]['image'])),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Container(
                                                        child: Text(
                                                          item[index]['name'],
                                                          style: TextStyle(
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: <Widget>[
                                                            Container(
                                                              child: Text(item[
                                                                      index][
                                                                  'description']),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        "Rs ${item[index]['price']}",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            // RaisedButton(
                                            //   onPressed: () {
                                            //     print("item added!");
                                            //   },
                                            //   child: const Text(
                                            //     "Add To Cart",
                                            //     style: TextStyle(
                                            //         fontSize: 20.0,
                                            //         fontWeight: FontWeight.bold),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (isEdit == true) ...[
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ],
                      ),
                    );
                  },
                );
              }
            } catch (e) {
              return Text('No data');
            }
            return Text('Loading');
          }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => Order()));
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent),
              child: Icon(
                Icons.shopping_basket,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                isEdit = isEdit ? false : true;
              });
              //  Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (ctx) => Home(),
              //   ),
              // );
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              print('hi');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => Home(),
                ),
              );
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
