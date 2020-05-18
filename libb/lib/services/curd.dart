import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class CrudMedthods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }
 
  Future<void> addData(itemData) async {
    if (isLoggedIn()) {
      Firestore.instance.collection('testcrud').add(itemData).catchError((e) {
         print(e);
       });
    } else {
      print('You need to be logged in');
    }
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference items = Firestore.instance.collection('items');
  Future additemData(
      String fname, String desc, int price) async {
    return await items.document(fname).setData({
      'item': fname,
      'description': desc,
      'price': price,
    });
  }
}