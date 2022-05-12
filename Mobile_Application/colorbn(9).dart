import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(1).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(2).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(3).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(4).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(5).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(6).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(7).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(8).dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/showANS.dart';
import 'package:flutter_application_select_major/utility/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cbntest9 extends StatefulWidget {
  @override
  _Cbntest9State createState() => _Cbntest9State();
}

int? _selectedChoice = null;
int? allValue9 = _selectedChoice;
int? keepvalue9 = allValue1! +
    allValue2! +
    allValue3! +
    allValue4! +
    allValue5! +
    allValue6! +
    allValue7! +
    allValue8! +
    allValue9!;

class _Cbntest9State extends State<Cbntest9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ทดสอบตาบอดสี  ข้อ 9'),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: Text('ทดสอบตาบอดสี')),
          SizedBox(height: 40),
          Image.asset('images/CBN/42.jpg', height: 200, width: 200),
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
                Text('42'),
                SizedBox(width: 30),
                Radio(
                    value: 0,
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value as int?;
                      });
                    }),
                Text('75')
              ],
            ),
          ),
          SizedBox(height: 40),
          // ignore: deprecated_member_use
          ElevatedButton(
            child: Text('ส่งคำตอบ'),
            onPressed: () {
              setState(
                () {
                  allValue9 = _selectedChoice;
                  if (allValue9 == null) {
                    print('กรุณาเลือกคำตอบ');
                    ScaffoldMessenger.of(context).showSnackBar(snackbar_no_ans);
                  } else if (allValue9 != null) {
                    print(keepvalue9);
                    // เริ่ม Condit 1 //
                    if (keepvalue9! == 9) {
                      print('คุณไม่มีอาการตาบอดสี');
                      update_status_CBN01();
                    }
                    // จบ Condit 1 //
                    // เริ่ม Condit 2 //
                    else if (keepvalue9! > 9 && keepvalue9! < 67) {
                      print('คุณมีอาการตาบอดสีประเภท แดง-เขียว');
                      update_status_CBN02();
                    }
                    // จบ Condit 2//
                    // เริ่ม Condit 3 //
                    else if (keepvalue9! > 67 && keepvalue9! < 100) {
                      print('คุณมีอาการตาบอดสีประเภททุกสี');
                      update_status_CBN03();
                    }
                    // จบ Condit 3//
                    // เริ่ม Condit 3 //
                    else if (keepvalue9! > 100) {
                      print('คุณมีอาการตาบอดสีประเภท เหลือง-น้ำเงิน');
                      update_status_CBN04();
                    }
                    // จบ Condit 3//
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowANS(),
                          settings: RouteSettings(arguments: keepvalue9)));
                },
              );
            },
          )
        ],
      ),
    );
  }

  // ################     Futrue Update Result ########### //
  Future<Null> update_status_CBN01() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id')!;
    String? std_colorbn = prefer.getString('std_colorbn');
    String apieditProfile =
        '${MyConstant.domain}/select_major/API_ColorBN/editUserWhereId.php?isAdd=true&std_id=$std_id&std_colorbn=$std_colorbn';
    String update_result =
        '${MyConstant.domain}/select_major/API_ColorBN/editUserWhereId.php?isAdd=true&std_id=$std_id&std_colorbn=ไม่มีอาการตาบอดสี';
    await Dio().get(apieditProfile).then((value) {
      print('### ส่งคำตอบแล้ว update succes ###');
      Dio().get(update_result);
    });
  }

  Future<Null> update_status_CBN02() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id')!;
    String? std_colorbn = prefer.getString('std_colorbn');
    String apieditProfile =
        '${MyConstant.domain}/select_major/API_ColorBN/editUserWhereId.php?isAdd=true&std_id=$std_id&std_colorbn=$std_colorbn';
    String update_result =
        '${MyConstant.domain}/select_major/API_ColorBN/editUserWhereId.php?isAdd=true&std_id=$std_id&std_colorbn=อาการตาบอดสีแดงเขียว';
    await Dio().get(apieditProfile).then((value) {
      print('อัพเดทอาการแล้ว');
      Dio().get(update_result);
    });
  }

  Future<Null> update_status_CBN03() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id')!;
    String? std_colorbn = prefer.getString('std_colorbn');
    String apieditProfile =
        '${MyConstant.domain}/select_major/API_ColorBN/editUserWhereId.php?isAdd=true&std_id=$std_id&std_colorbn=$std_colorbn';
    String update_result =
        '${MyConstant.domain}/select_major/API_ColorBN/editUserWhereId.php?isAdd=true&std_id=$std_id&std_colorbn=อาการตาบอดสีประเภททุกสี';
    await Dio().get(apieditProfile).then((value) {
      print('อัพเดทอาการแล้ว');
      Dio().get(update_result);
    });
  }
  Future<Null> update_status_CBN04() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id')!;
    String? std_colorbn = prefer.getString('std_colorbn');
    String apieditProfile =
        '${MyConstant.domain}/select_major/API_ColorBN/editUserWhereId.php?isAdd=true&std_id=$std_id&std_colorbn=$std_colorbn';
    String update_result =
        '${MyConstant.domain}/select_major/API_ColorBN/editUserWhereId.php?isAdd=true&std_id=$std_id&std_colorbn=อาการตาบอดสีน้ำเงินเหลือง';
    await Dio().get(apieditProfile).then((value) {
      print('อัพเดทอาการแล้ว');
      Dio().get(update_result);
    });
  }
}
