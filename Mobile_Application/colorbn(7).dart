// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(1).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(2).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(3).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(4).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(5).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(6).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(8).dart';

class Cbntest7 extends StatefulWidget {
  @override
  _Cbntest7State createState() => _Cbntest7State();
}

int? _selectedChoice = null;
int? allValue7 = _selectedChoice;
int? keepvalue7 = allValue1! + allValue2! + allValue3! + allValue4! + allValue5! +allValue6! + allValue7!;

class _Cbntest7State extends State<Cbntest7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ทดสอบตาบอดสี ข้อ 7'),
                backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: Text('ทดสอบตาบอดสี')),
          SizedBox(height: 40),
          Image.asset('images/CBN/73.jpg', height: 200, width: 200),
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
                    value: 1,
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value as int?;
                      });
                    }),
                Text('73'),
                SizedBox(width: 30),
                Radio(
                    value: 0,
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value as int?;
                      });
                    }),
                Text('99')
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
          allValue7 = _selectedChoice;
          if (allValue7 == null) {
            // all value เป็น Null คือไม่ได้เลือกอะไรเลย //
            print('กรุณาเลือกคำตอบ');
            ScaffoldMessenger.of(context).showSnackBar(snackbar_no_ans);
          }
          else if (allValue7 != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Cbntest8(),
                    settings: RouteSettings(arguments: keepvalue7)));
                      print(keepvalue7);
          }
        });
      },
    );
  }
}
