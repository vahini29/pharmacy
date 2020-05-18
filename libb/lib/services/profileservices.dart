import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileUserData {
  final String email;
  final String name;
  final String adress;
  ProfileUserData({this.name, this.email, this.adress});
}

class DatabaseeditService {
  // collection reference
  final CollectionReference datacollection1 =
      Firestore.instance.collection('users');

  ProfileUserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return ProfileUserData(
      email: snapshot.data['email'] ?? '',
      name: snapshot.data['name'] ?? '',
      adress: snapshot.data['address'] ?? '',
    );
  }

  Stream<ProfileUserData> userData(FirebaseUser user) {
    return datacollection1
        .document(user.uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
