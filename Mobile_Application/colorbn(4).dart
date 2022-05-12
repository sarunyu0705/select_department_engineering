// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(1).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(2).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(3).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(5).dart';

class Cbntest4 extends StatefulWidget {
  @override
  _Cbntest4State createState() => _Cbntest4State();
}

int? _selectedChoice = null;
int? allValue4 = _selectedChoice;
int? keepvalue4 = allValue1! + allValue2! + allValue3! + allValue4!;

class _Cbntest4State extends State<Cbntest4> {
  @override
  Widget build(BuildContext context) {
    Object? allValue3 = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('ทดสอบตาบอดสี ข้อ 4'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: Text('ทดสอบตาบอดสี')),
          SizedBox(height: 40),
          Image.asset('images/CBN/74.jpg', height: 200, width: 200),
          SizedBox(height: 40),
          Text('กรุณาเลือกคำตอบจากภาพที่เห็น'),
          SizedBox(height: 60),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                    value: 10,
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value as int?;
                      });
                    }),
                Text('ไม่สามารถอ่านได้'),
                SizedBox(width: 30),
                Radio(
                    value: 5,
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value as int?;
                      });
                    }),
                Text('21'),
                SizedBox(width: 30),
                Radio(
                    value: 1,
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value as int?;
                      });
                    }),
                Text('74')
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
          allValue4 = _selectedChoice;
          if (allValue4 == null) {
            // all value เป็น Null คือไม่ได้เลือกอะไรเลย //
            print('กรุณาเลือกคำตอบ');
            ScaffoldMessenger.of(context).showSnackBar(snackbar_no_ans);
          }
          else if (allValue4 != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Cbntest5(),
                    settings: RouteSettings(arguments: keepvalue4)));
                      print(keepvalue4);
          }
        });
      },
    );
  }
}
