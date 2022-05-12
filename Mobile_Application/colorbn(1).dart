// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(2).dart';

class Cbntest1 extends StatefulWidget {
  @override
  _Cbntest1State createState() => _Cbntest1State();
}
final snackbar_no_ans = SnackBar(content: Text('กรุณาเลือกคำตอบ',style: TextStyle(color: Colors.black),),backgroundColor: Colors.red,);
int? _selectedChoice = null;
int? allValue1 = _selectedChoice;
int? keepvalue1 = allValue1!;

class _Cbntest1State extends State<Cbntest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ทดสอบตาบอดสี ข้อที่ 1'),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: Text('ทดสอบตาบอดสี')),
          SizedBox(height: 40),
          Image.asset('images/CBN/12.jpg', height: 200, width: 200),
          SizedBox(height: 40),
          Text('กรุณาเลือกคำตอบจากภาพที่เห็น'),
          SizedBox(height: 60),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                    value: 0, // ข้อหลอก//
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value as int?;
                      });
                    }),
                Text('ไม่สามารถอ่านได้'), // ข้อหลอก//
                SizedBox(width: 30),
                Radio(
                    value: 1, // ไม่มีอาการ//
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        
                        _selectedChoice = value as int?;

                      });
                    }),
                Text('12'), // ไม่มีอาการ//
                SizedBox(width: 30),
                Radio(
                    value: 10, // ไม่มีอาการ//
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value as int?;
                        value = allValue1;
                      });
                    }),
                Text('36'), // ไม่มีอาการ//
              ],
            ),
          ),
          SizedBox(height: 40),
          send_ans_Button(context)
        ],
      ),
    );
  }

  ElevatedButton send_ans_Button(BuildContext context) {
    return ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.green),
          child: Text('ข้อถัดไป'),
          onPressed: () {
            setState(() {
              allValue1 = _selectedChoice;
              if (allValue1 == null) {      // all value เป็น Null คือไม่ได้เลือกอะไรเลย //
              print('กรุณาเลือกคำตอบ');
              ScaffoldMessenger.of(context).showSnackBar(snackbar_no_ans);
            }  if (allValue1 !=  null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Cbntest2(),
                      settings: RouteSettings(arguments: allValue1)));
            }
            print(allValue1);

            });
            
          },
        );
  }
}
