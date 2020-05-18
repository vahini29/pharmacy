import 'dart:io';

import 'package:flutter/material.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmacy/services/database.dart';

class AdditemWidget extends StatefulWidget {
  @override
  _AdditemWidgetState createState() => _AdditemWidgetState();
}

class _AdditemWidgetState extends State<AdditemWidget> {
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

  String itemname = '';
  String description = '';
  String catagory = '';
  int price;
  String url;
  File sampleImage;
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

  Future getImage(ImageSource source) async {
    var tempImage = await ImagePicker.pickImage(source: source);
    setState(() {
      sampleImage = tempImage;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var user = Provider.of<FirebaseUser>(context);
    // var userdata = Provider.of<ProfileUserData>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.pop(context);
                },
                splashColor: Colors.blue,
                highlightColor: Colors.blue,
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF6400),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Color(0xFF000000)),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 25.0,
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 10,
              ),
              Text(
                'Add item',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 90,
              ),
            ],
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
                    child: Icon(Icons.add_a_photo),
                  ),
                )
              : enableUpload(),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Item Name',
              helperStyle: TextStyle(color: Colors.white),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFF6400), width: 2.0),
              ),
            ),
            validator: (val) => val.isEmpty ? 'Enter proper name' : null,
            onChanged: (val) {
              setState(() => itemname = val);
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'Description',
              fillColor: Colors.white,
              filled: true,
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.white, width: 2.0),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFF6400), width: 2.0),
              ),
            ),
            validator: (val) => val.isEmpty ? 'Enter proper desciption' : null,
            onChanged: (val) {
              setState(() => description = val);
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Price',
              fillColor: Colors.white,

              filled: true,
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.white, width: 2.0),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFF6400), width: 3.0),
              ),
            ),
            validator: (val) => val.isEmpty ? 'Enter proper price' : null,
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
              hintText: 'catagory',
              fillColor: Colors.white,

              filled: true,
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.white, width: 2.0),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFF6400), width: 3.0),
              ),
            ),
            validator: (val) => val.isEmpty ? 'Enter proper price' : null,
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
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // textColor: Colors.white,
              // color: Colors.blue,
              onTap: () async {
                if (_formKey.currentState.validate()) {
                  final StorageReference firebaseStorageRef =
                      FirebaseStorage.instance.ref().child(itemname);
                  task = firebaseStorageRef.putFile(sampleImage);
                  progressIndicator(context, task);
                  var downurl =
                      await (await task.onComplete).ref.getDownloadURL();
                  setState(() {
                    url = downurl.toString();
                  });
                  await DatabaseService().updateUserData(
                    itemname,
                    description,
                    price,
                    url,
                    catagory,
                  );
                }
              },
            ),
          ],
        ],
      ),
    );
  }
}
