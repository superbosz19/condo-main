import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants/constants.dart';
import 'package:flutter_application_1/screen/login.dart';
import 'package:flutter_application_1/screen/view_charger.dart';

class Viewscreen extends StatefulWidget {
  Viewscreen({Key? key}) : super(key: key);

  @override
  _ViewscreenState createState() => _ViewscreenState();
}

class _ViewscreenState extends State<Viewscreen> {
  final auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                icon: Icon(
                  Icons.logout_outlined,
                ),
                color: kPrimaryColor,
              ))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("user-linecondo-A")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Viewcharger();
                          }),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // gradient: LinearGradient(
                          //     colors: [Colors.white, Colors.greenAccent]),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Charger",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_rounded),
                            SizedBox(
                              width: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                    children: snapshot.data!.docs.map(
                  (document) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 80,
                        width: 300,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.greenAccent]),
                          // color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 26.0,
                                backgroundColor: kPrimaryColor,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 25.0,
                                  child: FittedBox(
                                    child: Text(
                                      document["room"],
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                document["username"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              subtitle: Text(document["phonenumber"]),
                            ),
                            Row(
                              children: [
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.delete_rounded,
                                        color: Colors.red[300],
                                      ),
                                      onPressed: () {}),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ).toList()),
              ),
            ],
          );
        },
      ),
    );
  }
}
