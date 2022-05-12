// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(1).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(2).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(4).dart';

class Cbntest3 extends StatefulWidget {
  @override
  _Cbntest3State createState() => _Cbntest3State();
}

int? _selectChoice = null;
int? allValue3 = _selectChoice;
int? keepvalue3 = allValue1! + allValue2! + allValue3!;

class _Cbntest3State extends State<Cbntest3> {
  @override
  Widget build(BuildContext context) {
// นำค่า Value หน้าที่ 2 มารวมกับหน้าที่ 3 //
    return Scaffold(
      appBar: AppBar(
        title: Text('ทดสอบตาบอดสี ข้อ 3'),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: Text('ทดสอบตาบอดสี')),
          SizedBox(height: 40),
          Image.asset('images/CBN/3.jpg', height: 200, width: 200),
          SizedBox(height: 40),
          Text('กรุณาเลือกคำตอบจากภาพที่เห็น'),
          SizedBox(height: 60),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                    value: 10,
                    groupValue: _selectChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectChoice = value as int;
                      });
                    }),
                Text('ไม่สามารถอ่านได้'),
                SizedBox(width: 30),
                Radio(
                    value: 1,
                    groupValue: _selectChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectChoice = value as int?;
                      });
                    }),
                Text('3'),
                SizedBox(width: 30),
                Radio(
                    value: 5,
                    groupValue: _selectChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectChoice = value as int?;
                      });
                    }),
                Text('5')
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
          allValue3 = _selectChoice;
          if (allValue3 == null) {
            // all value เป็น Null คือไม่ได้เลือกอะไรเลย //
            print('กรุณาเลือกคำตอบ');
            ScaffoldMessenger.of(context).showSnackBar(snackbar_no_ans);
          }
          else if (allValue3 != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Cbntest4(),
                    settings: RouteSettings(arguments: keepvalue3)));
                      print(keepvalue3);
          }
        });
      },
    );
  }
}
