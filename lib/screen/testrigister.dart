import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/screen/login.dart';

class Registerscreen1 extends StatefulWidget {
  Registerscreen1({Key? key}) : super(key: key);

  @override
  _Registerscreen1State createState() => _Registerscreen1State();
}

class _Registerscreen1State extends State<Registerscreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/images/BGLogin.jpg"),
              fit: BoxFit.fitWidth),
        ),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: EdgeInsets.only(left: 55.0, top: 220.0),
                  child: Text(
                    'Register',
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                input("Username", false),
                input("Email", true),
                input("Password", true),
                input("Room No.", true),
                input("Phone number", true),
                input("Invite Code.", true),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            // ignore: prefer_const_constructors
                            builder: (context) => Loginscreen()));
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
                          "Register",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget input(String hint, bool pass) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 9.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: Colors.grey[100]),
      child: TextFormField(
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
