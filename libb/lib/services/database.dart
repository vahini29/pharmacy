// import 'package:cartapp/services/profileUserdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'cartdetails.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final DocumentReference items =
      Firestore.instance.collection('item').document();
  updateUserData(
      String fname, String desc, int price, String img, String category) {
    //addidng food data
    items.setData({
      'name': fname,
      'description': desc,
      'image': img,
      'price': price,
      'category': category,
      'id': items.documentID
    });
  }

  Future editUserData(
      {String fname,
      String desc,
      String img,
      bool isveg,
      int price,
      String id,
      String category}) async {
    final CollectionReference items = Firestore.instance.collection('item');
    return await items.document(id).updateData({
      'name': fname,
      'description': desc,
      // 'veg': isveg,
      'image': img,
      'price': price,
      'category': category,
    });
  }

  Future delete(String docId) async {
    final CollectionReference items = Firestore.instance.collection('item');
    return await items.document(docId).delete();
  }

  Future delivered(String docId, bool available) async {
    final CollectionReference items = Firestore.instance.collection('Corders');
    return await items.document(docId).updateData({'isDelivered': available});
  }

  storeOrder(
      {List<String> item,
      int price,
      List<int> count,
      String orderID,
      FirebaseUser user,
      List<CartItems> s,
      String address}) {
    List<String> item1 = [];
    List<int> count1 = [];
    for (int i = 0; i < s.length; i++) {
      item1.add(item[i]);
      count1.add(count[i]);
    }
    DocumentReference documentReference =
        Firestore.instance.collection('Corders').document(orderID);
    documentReference.setData({
      'address': address,
      'itemName': item1,
      'totalPrice': price,
      'itemCount': count1,
      'totalCount': s.length,
      'orderID': orderID,
      'userID': user.uid,
      'isDelivered': false
    });
  }
}
