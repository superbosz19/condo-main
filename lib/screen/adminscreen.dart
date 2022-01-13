// ignore_for_file: prefer_const_constructors, duplicate_ignore
import 'package:flutter/material.dart';


class Adminscreen extends StatefulWidget {
  const Adminscreen({Key? key}) : super(key: key);

  @override
  _AdminscreenState createState() => _AdminscreenState();
}


class _AdminscreenState extends State<Adminscreen> {
  int number = 0; //การสร้าง state

  //แสดงผลข้อมูล
  @override
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
              onPressed: () {},
            )),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ListView(
          children: const [
            
          ]
        ),
      )
        
      
    );
  }

Future<List<Widget>> getData (int count) async {
  //กลุ่มข้อมูล Text Wiget
  List<Widget>  data = [];
  for (var i = 0; i < count; i++){
    var menu = ListTile(
      title: Text('เมนูที่ ${i + i}',style: TextStyle(fontSize: 25.0),),
      subtitle: Text("หัวข้อย่อยที่ ${i + i}"),
    );
    data.add(menu);
  }
  return data;
}}