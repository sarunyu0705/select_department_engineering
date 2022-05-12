import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_select_major/(P3)menu.dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(9).dart';
import 'package:flutter_application_select_major/menu/menu_profile/viweprofile.dart';
import 'package:flutter_application_select_major/model/user_model.dart';
import 'package:flutter_application_select_major/utility/my_constant.dart';

class ShowANS extends StatefulWidget {
  @override
  _ShowANSState createState() => _ShowANSState();
}

class _ShowANSState extends State<ShowANS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ผลการทดสอบ'),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      body: Container(
          child: Column(
        children: [
          SizedBox(height: 65),
          Center(
            child: Text(
              'ผลการทดสอบตาบอดสี',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(height: 120),
          if (keepvalue9! == 9)
            Text(
              'คุณไม่มีอาการตาบอดสี',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green),
            ),
          if (keepvalue9! > 9 && keepvalue9! < 67)
            Column(
              children: [
                Text(
                  'คุณมีอาการตาบอดสี',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                Text(
                  'ประเภทสี แดง-เขียว',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red),
                ),
              ],
            ),
          if (keepvalue9! > 67 && keepvalue9! < 100)
            Text(
              'คุณมีอาการตาบอดสีทุกสี',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.orange),
            ),
          if (keepvalue9! > 100)
            Column(
              children: [
                Text(
                  'คุณมีอาการตาบอด',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                Text(
                  'สีน้ำเงิน-เหลือง',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue),
                )
              ],
            ),
          SizedBox(height: 120),
          goto_Menu()
        ],
      )),
    );
  }

  ElevatedButton goto_Menu() {
    return ElevatedButton(
        child: Text('กลับสู่เมนูหลัก'),
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Menu()))
              .then((value) => refreshData());
        });
  }

  // ################     Futrue Refresh Data ########### //
  Future<Null> refreshData() async {
    // เลือกแค่บ้าง User ที่ Edit มา Refresh //
    print('## ==>> refresh Data Naja');
    String apiget_whereUser =
        '${MyConstant.domain}/select_major/API_ColorBN/getUserWhereID.php?isConnect=true&std_id=${MyuserModel!.std_id}';
    await Dio().get(apiget_whereUser).then((value) {
      for (var item in json.decode(value.data)) {
        setState(() {
          MyuserModel = MyUserModel.fromMap(item);
        });
      }
    });
  }
}
