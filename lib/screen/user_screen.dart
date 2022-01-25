import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/screen/login.dart';
import 'package:flutter_application_1/screen/charger.dart';

class Viewscreen extends StatefulWidget {
  const Viewscreen({Key? key}) : super(key: key);

  @override
  _ViewscreenState createState() => _ViewscreenState();
}

class _ViewscreenState extends State<Viewscreen> {
  final auth = FirebaseAuth.instance;
  // ignore: annotate_overrides
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
                            return const Loginscreen();
                          }),
                        ),
                      );
                      // ignore: avoid_print
                      print("Logout");
                },
                icon: const Icon(
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Viewcharger();
                      },
                    ),
                  );
                },
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: Image.asset(
                    "assets/images/Charger-Status.png",
                  ),
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   // gradient: LinearGradient(
                  //   //     colors: [Colors.white, Colors.greenAccent]),
                  //   borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(10),
                  //       topRight: Radius.circular(10),
                  //       bottomLeft: Radius.circular(10),
                  //       bottomRight: Radius.circular(10)),
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.5),
                  //       spreadRadius: 5,
                  //       blurRadius: 7,
                  //       offset:
                  //           Offset(0, 3), // changes position of shadow
                  //     ),
                  //   ],
                  // ),
                ),
              ),
              Expanded(
                child: ListView(
                    children: snapshot.data!.docs.map(
                  (document) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(
                          // gradient: LinearGradient(
                          //     colors: [Colors.white, Colors.greenAccent]),
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
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
                                  const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start, 
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                                  child: Container(
                                    //height: 40,
                                    
                                    decoration: const BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Room: " + document["room"],
                                        style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0,top: 5.0),
                                  child: Text(
                                    "Name: " + document["username"],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0,top: 5.0),
                                  child: Text("Tel: " + document["phonenumber"]),
                                ),
                              ],
                            ),
                            // ListTile(
                            //   leading: CircleAvatar(
                            //     radius: 25.0,
                            //     backgroundColor: kPrimaryColor,
                            //     child: CircleAvatar(
                            //       backgroundColor: Colors.white,
                            //       radius: 23.0,
                            //       child: FittedBox(
                            //         child: Text(
                            //           document["room"],
                            //           style: TextStyle(color: kPrimaryColor),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            //   title: Text(
                            //     document["username"],
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 18.0),
                            //   ),
                            //   subtitle: Padding(
                            //     padding: const EdgeInsets.only(top: 5.0),
                            //     child: Text(document["phonenumber"]),
                            //   ),
                            // ),
                            Row(
                              children: [
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                      icon: const Icon(
                                        Icons.delete_rounded,
                                        color: Colors.grey,size: 18,
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
