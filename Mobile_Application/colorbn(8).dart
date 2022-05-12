import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(1).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(2).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(3).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(4).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(5).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(6).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(7).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(9).dart';

class Cbntest8 extends StatefulWidget {
  @override
  _Cbntest8State createState() => _Cbntest8State();
}

int? _selectedChoice = null;
int? allValue8 = _selectedChoice;
int? keepvalue8 = allValue1! +
    allValue2! +
    allValue3! +
    allValue4! +
    allValue5! +
    allValue6! +
    allValue7! +
    allValue8!;

class _Cbntest8State extends State<Cbntest8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ทดสอบตาบอดสี  ข้อ 8'),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: Text('ทดสอบตาบอดสี')),
          SizedBox(height: 40),
          Image.asset('images/CBN/8.jpg', height: 200, width: 200),
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
                    value: 100,
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value as int?;
                      });
                    }),
                Text('3'),
                SizedBox(width: 30),
                Radio(
                    value: 1,
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value as int?;
                      });
                    }),
                Text('8')
              ],
            ),
          ),
          SizedBox(height: 40),
          // ignore: deprecated_member_use
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
          allValue8 = _selectedChoice;
          if (allValue8 == null) {
            // all value เป็น Null คือไม่ได้เลือกอะไรเลย //
            print('กรุณาเลือกคำตอบ');
            ScaffoldMessenger.of(context).showSnackBar(snackbar_no_ans);
          }
          else if (allValue8 != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Cbntest9(),
                    settings: RouteSettings(arguments: keepvalue8)));
                      print(keepvalue8);
          }
        });
      },
    );
  }
}
