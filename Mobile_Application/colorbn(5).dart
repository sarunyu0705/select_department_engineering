// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(1).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(2).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(3).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(4).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(6).dart';

class Cbntest5 extends StatefulWidget {
  @override
  _Cbntest5State createState() => _Cbntest5State();
}

int? _selectedChoice = null;
int? allValue5 = _selectedChoice;
int? keepvalue5 =
    allValue1! + allValue2! + allValue3! + allValue4! + allValue5!;

class _Cbntest5State extends State<Cbntest5> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Object? allValue4 = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('ทดสอบตาบอดสี ข้อ 5'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: Text('ทดสอบตาบอดสี')),
          SizedBox(height: 40),
          Image.asset('images/CBN/45.jpg', height: 200, width: 200),
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
                Text('45'),
                SizedBox(width: 30),
                Radio(
                    value: 0,
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value as int?;
                      });
                    }),
                Text('80')
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
          allValue5 = _selectedChoice;
          if (allValue5 == null) {
            // all value เป็น Null คือไม่ได้เลือกอะไรเลย //
            print('กรุณาเลือกคำตอบ');
            ScaffoldMessenger.of(context).showSnackBar(snackbar_no_ans);
          }
          else if (allValue5 != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Cbntest6(),
                    settings: RouteSettings(arguments: keepvalue5)));
                      print(keepvalue5);
          }
        });
      },
    );
  }
}
