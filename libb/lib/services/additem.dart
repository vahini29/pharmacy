import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmacy/services/curd.dart';
// import 'package:pharmacy/services/curd.dart';

class AdditemWidget extends StatefulWidget {
  @override
  _AdditemWidgetState createState() => _AdditemWidgetState();
}
//any errors?yep
//share screen
//add
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
  String category = '';
  int price;
  File sampleImage;
  CrudMedthods curdobj = new CrudMedthods();
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
    //what happened?i lost connection //turn on  mic in hangoutyep i did//can you haer me?
    setState(() {
      sampleImage = tempImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
   
      body: Form(
        child: Column(
          children: <Widget>[
            sampleImage == null
                ? GestureDetector(
                    onTap: showBottomSheet,
                    child: Container(
                      decoration: BoxDecoration(
                          //what happened
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
              ),
              onChanged: (val) {
                setState(() => description = val);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Category',
                fillColor: Colors.white,
                filled: true,
              ),
              onChanged: (val) {
                setState(() => category = val);
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
              ),
              onChanged: (val) {
                setState(() {
                  price = int.parse(val);
                });
              },
            ),
            SizedBox(height: 20.0),
            if (sampleImage != null) ...[Uploader(file: sampleImage, fname:itemname,desc:description,price: price,)],
          ],
        ),
      ),
    );
  }
}

class Uploader extends StatefulWidget {
  final File file;final  String fname,  desc; final int price;
  Uploader({Key key, this.file,this.fname,this.desc,this.price}) : super(key: key);
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://pharmacyy-e4dd7.appspot.com');

  StorageUploadTask _uploadTask;

  /// Starts an upload task
  void _startUpload() {
    /// Unique file name for the file
    String filePath = 'images/${DateTime.now()}.png';

    setState(
      () {
        _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
      },
    );
    DatabaseService().additemData(widget.fname,widget.desc,widget.price);
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      /// Manage the task state and event subscription with a StreamBuilder
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (_, snapshot) {
            var event = snapshot?.data?.snapshot;

            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;

            return Column(
              children: [
                if (_uploadTask.isComplete) Text('🎉🎉🎉'),

                if (_uploadTask.isPaused)
                  FlatButton(
                    child: Icon(Icons.play_arrow),
                    onPressed: _uploadTask.resume,
                  ),

                if (_uploadTask.isInProgress)
                  FlatButton(
                    child: Icon(Icons.pause),
                    onPressed: _uploadTask.pause,
                  ),

                // Progress bar
                LinearProgressIndicator(value: progressPercent),
                Text('${(progressPercent * 100).toStringAsFixed(2)} % '),
              ],
            );
          });
    } else {
      // Allows user to decide when to start the upload
      return FlatButton.icon(
        label: Text('Upload to Firebase'),
        icon: Icon(Icons.cloud_upload),
        onPressed: _startUpload,
      );
    }
  }
}
//press play buttontop left
//turn on mic hangout
