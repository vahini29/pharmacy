import 'package:flutter/material.dart';

class Five extends StatefulWidget {
  Five({Key key}) : super(key: key);

  @override
  _FiveState createState() => _FiveState();
}

class _FiveState extends State<Five> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Baby Needs"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: (){})
        ],
      ),
      body:ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
                        height:150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage("images/babtshampoo.jpg")),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: myDetailsContainer1(),
                              ),
                            ),
                            SizedBox(
                              height: 15,),
                            RaisedButton(
                              onPressed: () {
                                print("item added!");
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
                        height:150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage("images/pampers.jfif")),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: myDetailsContainer2(),
                              ),
                            ),
                            SizedBox(
                              height: 15,),
                            RaisedButton(
                              onPressed: () {
                                Text(
                                  "item added",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
                        height:150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage("images/baby-oil-front.jpg")),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: myDetailsContainer3(),
                              ),
                            ),
                            SizedBox(
                              height: 15,),
                            RaisedButton(
                              onPressed: () {
                                Text(
                                  "item added",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
                        height:150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage("images/bbypowder.jpg")),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: myDetailsContainer4(),
                              ),
                            ),
                            SizedBox(
                              height: 15,),
                            RaisedButton(
                              onPressed: () {
                                Text(
                                  "item added",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
                        height:150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage("images/bbycream.jpg")),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: myDetailsContainer5(),
                              ),
                            ),
                            SizedBox(
                              height: 15,),
                            RaisedButton(
                              onPressed: () {
                                Text(
                                  "item added",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
                        height:150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage("images/bbysoap.jpg")),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: myDetailsContainer6(),
                              ),
                            ),
                            SizedBox(
                              height: 15,),
                            RaisedButton(
                              onPressed: () {
                                Text(
                                  "item added",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
                        height:150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage("images/bbyloation.jpg")),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: myDetailsContainer7(),
                              ),
                            ),
                            SizedBox(
                              height: 15,),
                            RaisedButton(
                              onPressed: () {
                                Text(
                                  "item added",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
                        height:150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage("images/bbycerlac.jpg")),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: myDetailsContainer8(),
                              ),
                            ),
                            SizedBox(
                              height: 15,),
                            RaisedButton(
                              onPressed: () {
                                Text(
                                  "item added",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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

      ),
    );
  }

  Widget myDetailsContainer1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              " BABY CARE PLUS ",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text("Baby Shampoo,300ml"),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Text("Rs 450",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
        )
      ],
    );
  }

  Widget myDetailsContainer2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              "PAMPERS DIAPERS",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text("L size, 20 pcs"),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Text("Rs 350",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
        )
      ],
    );
  }

  Widget myDetailsContainer3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              " JHONSAN'S OIL ",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text("Baby oil,500ml"),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Text("Rs 250",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
        )
      ],
    );
  }

  Widget myDetailsContainer4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              "JHONSON'S POWDER",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text("Baby powder,225g"),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Text("Rs 200",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
        )
      ],
    );
  }

  Widget myDetailsContainer5() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              " HIMALAYA ",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text("Baby Cream,200ml"),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Text("Rs 230",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
        )
      ],
    );
  }

  Widget myDetailsContainer6() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              "JOHNSON'S SOAP",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text("Soap with loation,150g"),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Text("Rs 49",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
        )
      ],
    );
  }

  Widget  myDetailsContainer7() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              "JHONSON'S LOATION",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text("Baby lotion,798ml"),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Text("Rs 550",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
        )
      ],
    );
  }

  Widget myDetailsContainer8() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              "NESTEL CERLAC",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text("Cerlac with milk,1Kg"),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Text("Rs 740",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
        )
      ],
    );
  }
}
