// ignore_for_file: deprecated_member_use, prefer_const_constructors, duplicate_ignore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/screen/profile.dart';
import 'package:flutter_application_1/screen/register.dart';
import 'package:flutter_application_1/screen/charger.dart';
import 'package:flutter_application_1/screen/user_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("user-linecondo-A");
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          // height: double.infinity,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/images/BGLogin.jpg"),
                fit: BoxFit.fitWidth),
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 55.0, top: 350.0),
                  child: Text(
                    'Log in',
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                // input("Username", false, true, false),
                // //TextFormField(keyboardType: TextInputType.emailAddress,),
                // input("Password", true, false, true),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 45.0, vertical: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey[100]),
                    child: TextFormField(
                      //controller: email,
                      onSaved: (var email) {
                        profile.email = email!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                      // validator: MultiValidator([
                      //   RequiredValidator(errorText: "Please enter your Email"),
                      //   EmailValidator(errorText: "Please enter your Email"),
                      // ]),
                    ),
                  ),
                ),
                //input("Password", true, false),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 45.0, vertical: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey[100]),
                    child: TextFormField(
                      //controller: password,
                      onSaved: (var password) {
                        profile.password = password!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                      // validator: MultiValidator([
                      //   RequiredValidator(errorText: "Please enter your Password"),
                      //   EmailValidator(errorText: "Please enter your Password"),
                      // ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: 60.0,
                //   ),
                //   child: TextButton(
                //     onPressed: () {},
                //     child: Text("Forget yor password?",
                //         style: TextStyle(color: Colors.grey)),
                //   ),
                // ),
                FlatButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState?.save();
                      try {
                        UserCredential user = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: profile.email,
                                password: profile.password);
                        formKey.currentState!.reset();

                        final DocumentSnapshot userdata =
                            await _userCollection.doc(user.user!.uid).get();
                        // ignore: avoid_print
                        print(userdata['role']);
                        if (userdata['role'] == 'admin') {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Viewscreen();
                              },
                            ),
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Viewcharger();
                              },
                            ),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        // ignore: avoid_print
                        print(e.message);

                        Fluttertoast.showToast(
                            gravity: ToastGravity.CENTER,
                            msg: e.message.toString());
                      }
                      // print(
                      //     "email = ${profile.email} password = ${profile.password}");

                    }
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              offset: Offset(3.0, 3.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                        ],
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      height: 40.0,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            // ignore: prefer_const_constructors
                            builder: (context) => Registerscreen()));
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              offset: Offset(3.0, 3.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                        ],
                        color: Colors.green[500],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      height: 40.0,
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget input(String hint, bool pass, bool emailkey, bool hintpass) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: Colors.grey[100]),
      child: TextFormField(
        obscureText: hintpass ? true : false,
        keyboardType: emailkey ? TextInputType.emailAddress : null,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: pass
                ? Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  )
                : Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  ),
            suffixIcon: pass
                ? null
                : Icon(
                    Icons.assignment_turned_in_rounded,
                    color: kPrimaryColor,
                  ),
            border: UnderlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

