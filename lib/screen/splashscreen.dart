// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_application_1/screen/view_charger.dart';
// import 'package:flutter_application_1/screen/view_screen.dart';



// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>{
//   //String role = 'user';

//   @override
//   void initState(){
//     super.initState();
//     _checkRole();
//   }

//   void _checkRole() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     final DocumentSnapshot snap = await FirebaseFirestore.instance.collection('user-linecondo-A').doc(user?.uid).get();

//     setState(() {
//       role = snap['role'];
//     });

//     if(role == null){
//       // navigateNext(Viewcharger());

//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (context) {
//             return Viewcharger();
//           }));
//     } else if(role == 'admin'){
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (context) {
//             return Viewscreen();
//           }));

//     }

//   }
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Text('welcome')
//           ],
//         ),
//       ),
//     );
//   }
// }