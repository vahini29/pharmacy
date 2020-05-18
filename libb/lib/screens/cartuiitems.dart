import 'package:pharmacy/services/cartdetails.dart';

// import './cartitems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'cartdetails.dart';

class F extends StatelessWidget {
  const F({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartDetails f = Provider.of<CartDetails>(context);
    List<CartItems> item = f.items;
    int len = item.length;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 55, 15, 0),
      child: ListView(
        children: List.generate(
          len,
          (int index) => Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                          item[index].imgPath,
                          height: 60,
                          width: 60,
                          fit: BoxFit.fill,
                        ) ??
                        CircleAvatar(backgroundColor: Colors.blue),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item[index].name,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Row(
                        children: <Widget>[
                          Text('*',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          Text(item[index].count.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ],
                      )
                    ],
                  ),
                  Text(
                    item[index].price.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print(index);
                          f.increaseItemCount(index);
                        },
                        child: Text('+',
                            style: TextStyle(
                                color: Color(0xFF0FDB48),
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ),
                      GestureDetector(
                        onTap: () {
                          f.decreaseItemCount(index);
                        },
                        child: Text(
                          '-',
                          style: TextStyle(
                              color: Color(0xFFFF6400),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              if (index == len-1) ...[
                SizedBox(
                  height: 50,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
