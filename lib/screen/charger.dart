import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/screen/login.dart';

class Viewcharger extends StatefulWidget {
  Viewcharger({Key? key}) : super(key: key);

  @override
  _ViewchargerState createState() => _ViewchargerState();
}

class _ViewchargerState extends State<Viewcharger> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                // Navigator.pop(
                //   context,
                // );
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
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("chargers").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<String> chargersId = ['GREY_0008', 'GREY_0009'];
          //print(snapshot.data!.docs);
          List<dynamic> usechargers = [];
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            if (chargersId.contains(snapshot.data?.docs[i].id)) {
              //print(snapshot.data!.docs[i].id);
              usechargers.add(snapshot.data?.docs[i]);
            }
          }
          return ListView.builder(
            itemCount: usechargers.length,
            itemBuilder: (context, int index) {
              final DocumentSnapshot usecharger = usechargers[index];

              // print(documentSnapshot["chargerID"]);
              // print(documentSnapshot["chargerStatus"]);
              return //Container(
                  //   child: Text(documentSnapshot["chargerID"]),
                  // );
                  Column(
                children: [
                  //008
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // gradient: LinearGradient(
                        // colors: [Colors.purple, Colors.blueAccent]),
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
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 20.0),
                                  child: Text(
                                    "ALFEN " + usecharger["chargerID"],
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: 14.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 5.0),
                                  child: Text(usecharger["locationID"]),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0.0, top: 10.0, bottom: 5.0),
                                  child: SizedBox(
                                    child: Icon(
                                      Icons.electric_car_rounded,
                                      color: usecharger["chargerStatus"] ==
                                              "AVAILABLE"
                                          ? kPrimaryColor
                                          : Colors.grey,
                                      size: 30.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child:
                                      // ?
                                      Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: usecharger["chargerStatus"] ==
                                                "AVAILABLE"
                                            ? kPrimaryColor
                                            : Colors.grey,
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Text(
                                      usecharger["chargerStatus"] == "OCCUPIED"
                                          ? "UNAVAILBLE"
                                          : "AVAILBLE",
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
