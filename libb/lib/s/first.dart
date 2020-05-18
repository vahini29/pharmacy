import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/services/cartdetails.dart';
import 'package:pharmacy/screens/cart.dart';
import 'package:provider/provider.dart';

class First extends StatefulWidget {
  First({Key key, this.category}) : super(key: key);
  final String category;
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (c) => Cart()));
              })
        ],
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('item')
              .where('category', isEqualTo:'Baby Needs')
              .snapshots(),
          builder: (context, snapshot) {
            final item = snapshot.data.documents;
            try {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
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
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          RaisedButton(
                                            onPressed: () {
                                              Provider.of<CartDetails>(context,
                                                      listen: false)
                                                  .addItem(
                                                      CartItems(
                                                        count: 1,
                                                        price: item[index]
                                                            ['price'],
                                                        oprice: item[index]
                                                            ['price'],
                                                        imgPath: item[index]
                                                            ['image'],
                                                        name: item[index]
                                                            ['name'],
                                                      ),
                                                      context);
                                              Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                  backgroundColor:
                                                      Colors.blueAccent,
                                                  content: Text(
                                                      "${item[index]['name']} added to cart"),
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              "Add To Cart",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            } catch (e) {
              return Text('No data');
            }
            if (!snapshot.hasData) {
              return Text('data');
            }
            
            return Text('Loading');
          }),
    );
  }
}
