// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(3).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(1).dart';

class Cbntest2 extends StatefulWidget {
  @override
  _Cbntest2State createState() => _Cbntest2State();
}

int? _selectedChoice = null;
int? allValue2 = _selectedChoice;
int? keepvalue2 = allValue1! + allValue2!;

class _Cbntest2State extends State<Cbntest2> {
  @override
  Widget build(BuildContext context) {
// นำค่า Value หน้าที่ 2 มารวมกับหน้าที่ 3 //
    return Scaffold(
      appBar: AppBar(
        title: Text('ทดสอบตาบอดสี ข้อ 2'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: Text('ทดสอบตาบอดสี')),
          SizedBox(height: 40),
          Image.asset('images/CBN/29.jpg', height: 200, width: 200),
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
                Text('70'),
                SizedBox(width: 30),
                Radio(
                  value: 1,
                  groupValue: _selectedChoice,
                  onChanged: (value) {
                    setState(() {
                      _selectedChoice = value as int?;
                    });
                  },
                ),
                Text('29'),
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
          allValue2 = _selectedChoice;
          if (allValue2 == null) {
            // all value เป็น Null คือไม่ได้เลือกอะไรเลย //
            print('กรุณาเลือกคำตอบ');
            ScaffoldMessenger.of(context).showSnackBar(snackbar_no_ans);
          }
          else if (allValue2 != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Cbntest3(),
                    settings: RouteSettings(arguments: keepvalue2)));
                      print(keepvalue2);
          }
        });
      },
    );
  }
}
