import 'dart:io';
//hangout

// import 'package:cartapp/services/food.dart';
// import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';

import '../services/database.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmacy/services/database.dart';

class Additem1Widget extends StatefulWidget {
  Additem1Widget({@required this.item});
  final  item;

  @override
  _Additem1WidgetState createState() => _Additem1WidgetState();
}

// enum typefood { veg, nonveg }

class _Additem1WidgetState extends State<Additem1Widget> {
  //  food;
  // _Additem1WidgetState(this.food);

  String foodname = '';
  String description = '', catagory = '';
  int price;
  String url;
  // String vegn;
  File sampleImage;
  // typefood _character = typefood.veg;
  bool b2 = true;
  bool isveg = true;

  Widget enableUpload() {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: showBottomSheet,
            child: Image.file(
              sampleImage,
              height: 100.0,
              width: 100.0,
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          var width = MediaQuery.of(context).size.width;
          var height = MediaQuery.of(context).size.height;
          return Container(
            height: height / 8,
            width: width,
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    print('hi');

                    getImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: width / 2,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[Icon(Icons.camera), Text('Camera')],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print('hi');
                    getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: width / 2,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.insert_photo),
                        Text('Gallery')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  StorageUploadTask task;
  progressIndicator(BuildContext context, StorageUploadTask task) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Uploading',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StreamBuilder<StorageTaskEvent>(
                    stream: task.events,
                    builder: (context, snapshot) {
                      var event = snapshot?.data?.snapshot;
                      double progressPercent = event != null
                          ? event.bytesTransferred / event.totalByteCount
                          : 0;
                      return Column(
                        children: <Widget>[
                          CircularPercentIndicator(
                            lineWidth: 15,
                            progressColor: Color(0xFFFF6400),
                            animation: true,
                            radius: 250,
                            percent: progressPercent,
                            center: Text(
                              '${(progressPercent * 100).toStringAsFixed(2)} %',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          if (task.isInProgress) ...[
                            Text('please wait until we uplaod'),
                          ],
                          if (task.isComplete) ...[
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  child: Text(
                                    'Close',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      );
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  Future getImage(ImageSource source) async {
    var tempImage = await ImagePicker.pickImage(source: source);
    setState(() {
      sampleImage = tempImage;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // _showsnackbar() {
  //   final snackBar = new SnackBar(
  //     content: new Text('Text Copied 😎'),
  //     duration: new Duration(seconds: 3),
  //   );
  //   _scaffoldKey.currentState.showSnackBar(snackBar);
  // }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Edit Item",
          style: TextStyle(
              fontFamily: 'Pacifico', fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        // leading: AbsorbPointer(
        //     absorbing: true, child: Icon(Icons.camera, color: Colors.white)),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                   
                    SizedBox(
                      height: 20,
                    ),
                    sampleImage == null
                        ? GestureDetector(
                            onTap: showBottomSheet,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              height: 200,
                              width: 200,
                              // child: Image.network(
                              //   'food.image',
                              //   fit: BoxFit.fitWidth,
                              // ),
                              child: Icon(Icons.add_a_photo),
                            ),
                          )
                        : enableUpload(),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Item_name',
                        helperText: widget.item['name'],
                        helperStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFFF6400), width: 2.0),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() => foodname = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        helperText: widget.item['description'],
                        helperStyle: TextStyle(color: Colors.white),
                        hintText: 'Description',
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFFF6400), width: 2.0),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() => description = val);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                   
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        helperText:  widget.item['price'].toString(),
                      hintText: 'price',
                        fillColor: Colors.white,
                        helperStyle: TextStyle(color: Colors.white),
                        filled: true,
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.white, width: 2.0),
                        // ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFFF6400), width: 3.0),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() {
                          price = int.parse(val);
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        helperText:  widget.item['category'],
                        fillColor: Colors.white,
                        helperStyle: TextStyle(color: Colors.white),
                        filled: true,
                       hintText: 'category',
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFFF6400), width: 3.0),
                        ),
                      ),
                      validator: (val) =>
                          val.isEmpty ? 'Enter proper catagory' : null,
                      onChanged: (val) {
                        setState(() {
                          catagory = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                   
                    if (sampleImage != null) ...[
                      InkWell(
                        // elevation: 7.0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFFF6400),
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Upload Image',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        // textColor: Colors.white,
                        // color: Colors.blue,
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            final StorageReference firebaseStorageRef =
                                FirebaseStorage.instance.ref().child(foodname);
                            task = firebaseStorageRef.putFile(sampleImage);
                            progressIndicator(context, task);
                            var downurl = await (await task.onComplete)
                                .ref
                                .getDownloadURL();
                            setState(() {
                              url = downurl.toString();
                            });
                            await DatabaseService().editUserData(
                                fname: foodname,
                                desc: description,
                                img: url,
                                price: price,
                                // isveg: isveg,
                                id: widget.item['id'],
                                category: catagory);
                          }
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
