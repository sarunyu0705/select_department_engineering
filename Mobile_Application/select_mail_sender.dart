import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/(P3)menu.dart';
import 'package:flutter_application_select_major/model/major_model.dart';
import 'package:flutter_application_select_major/model/user_model.dart';
import 'package:flutter_application_select_major/utility/my_constant.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Major_send_mail extends StatefulWidget {
  const Major_send_mail({Key? key}) : super(key: key);

  @override
  State<Major_send_mail> createState() => _Major_send_mailState();
}

final emailController = TextEditingController();
final subjectController = TextEditingController(
  text: 'ทดสอบการยืนยันการเลือกสาขา',
);
final bodyController = TextEditingController();
MyUserModel? _MyUserModel;
MyMajorModel? _MyMajorModel;

class _Major_send_mailState extends State<Major_send_mail> {
  @override
  void initState() {
    super.initState();
    findUserModel();
    load_Major_fromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ยืนยันการเลือกสาขา'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              send_mail();
            },
            icon: Icon(Icons.send),
          ),
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Menu()));
              }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ถึง',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: subjectController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'หัวข้อ',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: bodyController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                      labelText: 'รายละเอียด', border: OutlineInputBorder()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------------------------------------------------------------------------//
  Future findUserModel() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    String apiprofile =
        '${MyConstant.domain}/project/send_mail.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard';
    await Dio().get(apiprofile).then((value) {
      // then แปลว่า "แล้ว" ใช้ต่อจากคำสั่งบางตัว //
      print('## ===>> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          _MyUserModel = MyUserModel.fromMap(item);
          print('### ล็อคอินรหัส = ${_MyUserModel!.std_id}');
          print('### ล็อคอินชื่อ = ${_MyUserModel!.std_firstname} ${_MyUserModel!.std_lastname}');
          print('### ล็อคอินอีเมล = ${_MyUserModel!.std_email}');
          emailController.text = _MyUserModel!.std_email;
        });
      }
    });
  }

// -----------------------------------------------------------------------------------------------------------------------------------//
  Future load_Major_fromAPI() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    String? api_show_major =
        '${MyConstant.domain}/select_major/API_Major/get_selectMajor.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard';
    await Dio().get(api_show_major).then((value) {
      print('name major ==>> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          _MyMajorModel = MyMajorModel.fromMap(item);
          bodyController.text =
              'ผลการเลือกสาขา\n\nสาขาลำดับที่ 01   ${_MyMajorModel!.major_1}\n\nสาขาลำดับที่ 02   ${_MyMajorModel!.major_2}\n\nสาขาลำดับที่ 03   ${_MyMajorModel!.major_3}\n\nสาขาลำดับที่ 04   ${_MyMajorModel!.major_4}\n\nสาขาลำดับที่ 05   ${_MyMajorModel!.major_5}\n\nสาขาลำดับที่ 06   ${_MyMajorModel!.major_6}\n\nสาขาลำดับที่ 07   ${_MyMajorModel!.major_7}\n\nสาขาลำดับที่ 08   ${_MyMajorModel!.major_8}\n\nสาขาลำดับที่ 09   ${_MyMajorModel!.major_9}\n\nสาขาลำดับที่ 10    ${_MyMajorModel!.major_10}\n\nสาขาลำดับที่ 11   ${_MyMajorModel!.major_11}\n\nสาขาลำดับที่ 12   ${_MyMajorModel!.major_12}';
        });
      }
    });
  }
// -----------------------------------------------------------------------------------------------------------------------------------//

  Future send_mail() async {
    final Email email = Email(
        body: bodyController.text,
        subject: subjectController.text,
        recipients: [emailController.text]);
    String platformResponse;
    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'ส่งอีเมลยืนยันสำเร็จ';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }
}
