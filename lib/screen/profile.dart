import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Profile {
  // ignore: prefer_typing_uninitialized_variables
  var email;
  // ignore: prefer_typing_uninitialized_variables
  var password;

  Profile({this.email, this.password});
}

class DataUser {
  var role;
  var username;
  var roomuser;
  var phonenumber;

  DataUser({
    this.role,
    this.username,
    this.roomuser,
    this.phonenumber,
  });
}

Future<void> userSetup(var user) async {
  CollectionReference user = FirebaseFirestore.instance.collection('user');
  FirebaseFirestore.instance.collection("user");
  FirebaseAuth auth = FirebaseAuth.instance;
  var uid = auth.currentUser!.uid.toString();
  return;
}

