import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/(P3)menu.dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(1).dart';
import 'package:flutter_application_select_major/model/user_model.dart';
import 'package:flutter_application_select_major/utility/my_constant.dart';
import 'package:flutter_application_select_major/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CBN_Welcome extends StatefulWidget {
  const CBN_Welcome({Key? key}) : super(key: key);

  @override
  State<CBN_Welcome> createState() => _CBN_WelcomeState();
}

MyUserModel? MyuserModel;

class _CBN_WelcomeState extends State<CBN_Welcome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ทดสอบตาบอดสี'),
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
            Text('การทดสอบตาบอดสี',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/CBN/logo_CBN.png',
                  width: 180,
                  height: 180,
                ),
              ],
            ),
            SizedBox(height: 30),
            Text('คำแนะนำ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 30),
            Text('!!! การทดสอบตาบอดสีทำได้เพียง 1 ครั้ง เท่านั้น !!!'),
            SizedBox(height: 15),
            Text('โดยแบบทดสอบจะมีทั้งหมด 9 ข้อ'),
            SizedBox(height: 15),
            Text('* หมายเหตุ * อาการตาบอดสีมีผลต่อการเลือกสาขา'),
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
          prefer_colorblindness();
        });
  }

  //  __________________________________________________________________________ //
  // ##########       Start Futrue        ###############################//
  // จดจำค่าการทดสอบตาบอดสี
  Future<Null> prefer_colorblindness() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? std_id = preferences.getString('std_id');
    String? std_colorbn = preferences.getString('std_colorbn');
    String apiprofile =
        '${MyConstant.domain}/project/get_color.php?isConnect=true&std_id=$std_id&std_colorbn=$std_colorbn';
    await Dio().get(apiprofile).then((value) async {
      print('#### value for Api ==>> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          MyUserModel model = MyUserModel.fromMap(item); //**/
          if (model.std_colorbn == 'ยังไม่ได้ทดสอบ' || model.std_colorbn == '') {
            print('ยังไม่ได้ทดสอบ');
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Cbntest1()));
          }
          if (model.std_colorbn == 'ไม่มีอาการตาบอดสี') {
            print('ไม่มีอาการตาบอดสี');
            MyDialog().colorbn_no_bon(context, 'อาการ', 'รายละเอียด');
            // ใช้ Dialog แทน
          }
          if (model.std_colorbn == 'อาการตาบอดสีแดงเขียว') {
            print('มีอาการตาบอดสีแดงเขียว');
            MyDialog().colorbn_red_green(context, 'อาการ', 'รายละเอียด');
          }
          if (model.std_colorbn == 'อาการตาบอดสีประเภททุกสี') {
            print('มีอาการตาบอดสีประเภททุกสี');
            MyDialog().colorbn_all(context, 'อาการ', 'รายละเอียด');
          }
          if (model.std_colorbn == 'อาการตาบอดสีน้ำเงินเหลือง') {
            print('มีอาการตาบอดสีน้ำเงินเหลือง');
            MyDialog().colorbn_yellow_blue(context, 'อาการ', 'รายละเอียด');
          }
        });
      }
    });
  }

}
