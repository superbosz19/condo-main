import 'package:auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/screen/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCc_AHbw04kfodsawgTPHgyeHu2tDYkEQI", // Your apiKey
      appId: "1:570129048847:web:5f1c8792e2e2d84f9e4a7a", // Your appId
      messagingSenderId: "570129048847", // Your messagingSenderId
      projectId: "dark-form-307608", // Your projectId
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Flutter Demo',
      home: const Loginscreen(),
    );
  }
}

class AppBarScreen extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;

  AppBarScreen() : preferredSize = Size.fromHeight(56.0);
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // ignore: prefer_const_constructors
      leading: SizedBox(
          width: 200,
          height: 200,
          child: IconButton(
            padding: const EdgeInsets.all(7.5),
            icon: Image.asset(
              'assets/images/logo p.png',
              height: 700.0,
              width: 700.0,
            ),
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
          )),
      backgroundColor: Colors.white,
      actions: [
        SizedBox(
            width: 50,
            height: 100,
            child: IconButton(
              onPressed: () {
                auth.signOut().then(
                      (value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Loginscreen();
                        }),
                      ),
                    );
              },
              icon: Icon(Icons.logout_outlined),
              color: kPrimaryColor,
            ))
      ],
    );
  }
}
