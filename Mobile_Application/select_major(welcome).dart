import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/(P3)menu.dart';
import 'package:flutter_application_select_major/menu/menu_SelectMajor/select_major(select).dart';
import 'package:flutter_application_select_major/menu/menu_SelectMajor/select_major(select_bn).dart';
import 'package:flutter_application_select_major/menu/menu_SelectMajor/select_major(store).dart';
import 'package:flutter_application_select_major/menu/menu_SelectMajor/select_major(store_bn).dart';
import 'package:flutter_application_select_major/model/app_state_model.dart';
import 'package:flutter_application_select_major/model/user_model.dart';
import 'package:flutter_application_select_major/utility/my_constant.dart';
import 'package:flutter_application_select_major/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Major_Welcome extends StatefulWidget {
  const Major_Welcome({Key? key}) : super(key: key);

  @override
  State<Major_Welcome> createState() => _Major_WelcomeState();
}

class _Major_WelcomeState extends State<Major_Welcome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('การเลือกสาขาวิชา'),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Menu()));
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'การเลือกสาขาวิชา',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/selectMajor.jpg',
                  width: 180,
                  height: 180,
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'คำแนะนำ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(' นักศึกษาสามารถเลือกสาขาวิชาตามคณะระบุไว้ '),
            SizedBox(height: 15),
            Text('โดยจะมีสาขาทั้งหมด 13 สาขาวิชา'),
            SizedBox(height: 15),
            Text('* หมายเหตุ * สามารถเปลี่ยนแปลงลำดับสาขาที่เลือก'),
            Text('ตามวันเวลาที่กำหนด'),
            SizedBox(height: 30),
            gofrist_button(context),
          ],
        ),
      ),
    );
  }

//####################    Start Method    ##############//
  ElevatedButton gofrist_button(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.green),
        child: Text('ตกลง'),
        onPressed: () {
          preferance_selectmajor();
        });
  }

  Future<Null> preferance_selectmajor() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    String api_get_valueMajor =
        '${MyConstant.domain}/project/get_department_state.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard';
    await Dio().get(api_get_valueMajor).then((value) {
      for (var item in json.decode(value.data)) {
        print(value);
        AppState model_on_off = AppState.fromMap(item);
        if (model_on_off.select_major_state == 'เปิดระบบ') {
          print('การเลือกสาขาเปิดอยู่');
          MyUserModel model =
              MyUserModel.fromMap(item); // นำ value in class MyMajor มาใช้ //
          if (model.std_colorbn == '' ||
              model.std_colorbn == 'ยังไม่ได้ทดสอบ') {
            MyDialog().colorbn_untest(context, 'title', 'message');
          } else if (model.std_colorbn == 'ไม่มีอาการตาบอดสี') {
            if (model.std_major == '' ||
                model.std_major == 'ยังไม่ได้เลือกสาขา') {
              print('ยังไม่ได้เลือกสาขา');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Major_Select()));
            } else {
              print('เลือกสาขาแล้ว');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Major_Store()));
            }
          } else if (model.std_colorbn == 'อาการตาบอดสีแดงเขียว' ||
              model.std_colorbn == 'อาการตาบอดสีน้ำเงินเหลือง' ||
              model.std_colorbn == 'อาการตาบอดสีทุกสี') {
            if (model.std_major == '' ||
                model.std_major == 'ยังไม่ได้เลือกสาขา') {
              print('ยังไม่ได้เลือกสาขา (สำหรับผู้มีอาการตาบอดสี) ');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Major_SelectBN()));
            } else {
              print('เลือกสาขาแล้ว');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Major_StoreBN()));
            }
          }
        } else {
          print('การเลือกสาขาปิดแล้ว');
          MyDialog().system_close(context, 'title', 'message');
        }
        // -------------------------------------------------------------------------//
      }
    });
  }
}
