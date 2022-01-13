import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/contants/constants.dart';
import 'package:flutter_application_1/main.dart';
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
      body: ListView(
        children: [
          //1
          chage("A", "Testlocation1", true),
          //2
          chage("B", "Testlocation2", false),
          //3
          chage("C", "Testlocaion", false),
          //4
          chage("D", "Testlocaion", true),
        ],
      ),
    );
  }
}

Widget chage(
  String namechage,
  String namelocation,
  bool available,
) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 80,
      width: 300,
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 80.0, top: 20.0),
                  child: Text(
                    namechage,
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(namelocation),
                )
              ],
            ),
          ),
          Spacer(),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 0.0, top: 10.0, bottom: 5.0),
                  child: SizedBox(
                    child: Icon(
                      Icons.electric_car_rounded,
                      color: kPrimaryColor,
                      size: 30.0,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: available
                        ? Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: kPrimaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text(
                              "Available",
                              style: TextStyle(
                                  fontSize: 12.0, color: kPrimaryColor),
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: kErrorColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text(
                              "Unavailable",
                              style:
                                  TextStyle(fontSize: 12.0, color: kErrorColor),
                            ),
                          ))
              ],
            ),
          )
        ],
      ),
    ),
  );
}