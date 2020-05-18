import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/services/profileservices.dart';
import 'package:provider/provider.dart';
class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var user1 = Provider.of<FirebaseUser>(context);

    return StreamProvider.value(
      value: DatabaseeditService().userData(user1),
      child: Scaffold(
        body: G(),
      ),
    );
  }
}

class G extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return F();
  }
}

class F extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var user=Provider.of<ProfileUserData>(context);
    return
     Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Text('User Name : ${user.name}',style: TextStyle(fontSize: 25),),
         Text('User email : ${user.email}',style: TextStyle(fontSize: 25),),
         Text('User adress : ${user.adress}',style: TextStyle(fontSize: 25),),
       
       ],
      
    );
  }
}