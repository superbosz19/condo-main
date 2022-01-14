// ignore_for_file: deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants/constants.dart';
import 'package:flutter_application_1/screen/login.dart';
import 'package:flutter_application_1/screen/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registerscreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Registerscreen({Key? key}) : super(key: key);

  @override
  _RegisterscreenState createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  DataUser mydatauser = DataUser();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("user-linecondo-A");
  FirebaseAuth auth = FirebaseAuth.instance;

  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              //appBar: AppBarScreen(),
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
                        //SizedBox(height: 250,),
                        Padding(
                          padding: const EdgeInsets.only(left: 55.0, top: 300),
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 28.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        //input("Username", false, false),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 45.0, vertical: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.grey[100]),
                            child: TextFormField(
                              //controller: email,
                              onSaved: (var username) {
                                mydatauser.username = username!;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Username",
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Colors.black,
                                ),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ),
                        //emailinput(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 45.0, vertical: 5.0),
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
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 45.0, vertical: 5.0),
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
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              // validator: MultiValidator([
                              //   RequiredValidator(errorText: "Please enter your Password"),
                              //   EmailValidator(errorText: "Please enter your Password"),
                              // ]),
                            ),
                          ),
                        ),
                        // input("Room No.", true, false),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 45.0, vertical: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.grey[100]),
                            child: TextFormField(
                              //controller: email,
                              onSaved: (var roomuser) {
                                mydatauser.roomuser = roomuser!;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Room No.",
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Colors.black,
                                ),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ),
                        // input("Phone number", true, false),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 45.0, vertical: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.grey[100]),
                            child: TextFormField(
                              //controller: email,
                              onSaved: (var phonenumber) {
                                mydatauser.phonenumber = phonenumber!;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Phone number",
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Colors.black,
                                ),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ),
                        // input("Invite Code.", true, false),

                        FlatButton(
                          onPressed: () async {
                            // print("${mydatauser.username}");
                            // print("${mydatauser.roomuser}");
                            // print("${mydatauser.phonenumber}");
                            if (formKey.currentState!.validate()) {
                              formKey.currentState?.save();
                              try {
                                UserCredential user = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                        email: profile.email,
                                        password: profile.password);
                                print(user.user!.uid);

                                _userCollection.doc(user.user!.uid).set({
                                  "role": mydatauser.role,
                                  "username": mydatauser.username,
                                  "room": mydatauser.roomuser,
                                  "phonenumber": mydatauser.phonenumber
                                });

                                formKey.currentState?.reset();
                                Fluttertoast.showToast(
                                    msg: "Successfully",
                                    gravity: ToastGravity.TOP);
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Loginscreen();
                                }));
                              } on FirebaseAuthException catch (e) {
                                print(e.code);
                                String message;

                                if (e.code == 'Register-alerady-in-use') {
                                  message = 'Register already';
                                } else if (e.code == 'weak-password') {
                                  message = "รหัสผ่านต้องมีความยาว 6 ตัวขึ้นไป";
                                } else {
                                  message = e.message!;
                                }

                                Fluttertoast.showToast(
                                    msg: message, gravity: ToastGravity.CENTER);
                              }
                              // print(
                              //     "email = ${profile.email} password = ${profile.password}");

                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 40.0),
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
                                  "Create an account",
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
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

Widget input(
  String hint,
  bool pass,
  bool emailkey,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 7.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: Colors.grey[100]),
      child: TextFormField(
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

// Widget emailinput() {
//   // Profile profile = Profile;
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 7.0),
//     child: Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30.0), color: Colors.grey[100]),
//       child: TextFormField(
//         // onSaved: (String email) {
//         //   profile.email = email;
//         // },
//         keyboardType: TextInputType.emailAddress,
//         decoration: InputDecoration(
//             hintText: "E-mail",
//             prefixIcon: Icon(
//               Icons.person_outline,
//               color: Colors.black,
//             ),
//             border: UnderlineInputBorder(borderSide: BorderSide.none)),
//       ),
//     ),
//   );
// }
