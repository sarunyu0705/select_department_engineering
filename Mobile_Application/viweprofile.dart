import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/(P3)menu.dart';
import 'package:flutter_application_select_major/menu/menu_profile/editprofile.dart';
import 'package:flutter_application_select_major/model/user_model.dart';
import 'package:flutter_application_select_major/utility/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:image_picker/image_picker.dart';

class ViweProfile extends StatefulWidget {
  const ViweProfile({Key? key}) : super(key: key);

  @override
  State<ViweProfile> createState() => _ViweProfileState();
}

MyUserModel? MyuserModel;

class _ViweProfileState extends State<ViweProfile> {
  @override
  void initState() {
    super.initState();
    findUserModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว'),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false, // Close BackForward NajaEiEi
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Menu()));
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'ข้อมูลส่วนตัวของนักศึกษา',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 30),
                    std_id_text(),
                    SizedBox(height: 20),
                    name_text(),
                    SizedBox(height: 20),
                    email_text(),
                    SizedBox(height: 20),
                    tel_text(),
                    SizedBox(height: 20),
                    idcard_text(),
                    SizedBox(height: 20),
                    std_std_colorblindness(),
                    SizedBox(height: 35),
                    ElevatedButton(
                      child: Text('แก้ไข้ข้อมูล'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditProfile())).then((value) =>
                            refreshData()); // then แปลว่า "แล้ว" ใช้ต่อจากคำสั่งบางตัว //
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      // backgroundColor: Colors.red[300],
    );
  }

//_______________________     Method Start__________________________//
  Future findUserModel() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    // String? std_idcard = prefer.getString('std_idcard');
    String apiprofile =
        '${MyConstant.domain}/project/get_profile.php?isConnect=true&std_id=$std_id';
    await Dio().get(apiprofile).then((value) {
      // then แปลว่า "แล้ว" ใช้ต่อจากคำสั่งบางตัว //
      print('## ===>> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          MyuserModel = MyUserModel.fromMap(item);
          print('### ล็อคอินรหัส = ${MyuserModel!.std_id}');
          print('### ล็อคอินชื่อ = ${MyuserModel!.std_firstname}');
          print('### ล็อคอินนามสกุล = ${MyuserModel!.std_lastname}');
          print('### ล็อคอินอีเมล = ${MyuserModel!.std_email}');
          print('### ล็อคอินเบอร์ = ${MyuserModel!.std_tel}');
          print('### ล็อคอินปชช = ${MyuserModel!.std_idcard}');
          print('### สถานะการทดสอบ = ${MyuserModel!.std_colorbn}');
        });
      }
    });
  }

  Future<Null> refreshData() async {
    // เลือกแค่บ้าง User ที่ Edit มา Refresh //
    print('## ==>> refresh Data Naja');
    String apiget_whereUser =
        '${MyConstant.domain}/project/get_profile.php?isConnect=true&std_id=${MyuserModel!.std_id}';
    await Dio().get(apiget_whereUser).then((value) {
      for (var item in json.decode(value.data)) {
        setState(() {
          MyuserModel = MyUserModel.fromMap(item);
        });
      }
    });
  }

  Container std_std_colorblindness() {
    return Container(
      decoration: decoration_text(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(Icons.remove_red_eye),
            SizedBox(width: 10),
            Text('อาการตาบอดสี   :'),
            SizedBox(width: 20),
            Flexible(
              child: Text(MyuserModel == null
                  ? 'กำลังดาวโหลดข้อมูล'
                  : MyuserModel!.std_colorbn),
            ),
          ],
        ),
      ),
    );
  }

  Container idcard_text() {
    return Container(
      decoration: decoration_text(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(Icons.format_indent_increase_outlined),
            SizedBox(width: 10),
            Text('เลขบัตรประชาชน   :'),
            SizedBox(width: 20),
            Text(MyuserModel == null
                ? 'กำลังดาวโหลดข้อมูล'
                : MyuserModel!.std_idcard),
          ],
        ),
      ),
    );
  }

  Container tel_text() {
    return Container(
      decoration: decoration_text(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(Icons.call),
            SizedBox(width: 10),
            Text('เบอร์โทรศัพท์   :'),
            SizedBox(width: 20),
            Text(MyuserModel == null
                ? 'กำลังดาวโหลดข้อมูล'
                : MyuserModel!.std_tel),
          ],
        ),
      ),
    );
  }

  Container email_text() {
    return Container(
      decoration: decoration_text(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(Icons.email),
            SizedBox(width: 10),
            Text('อีเมล   :'),
            SizedBox(width: 20),
            Text(MyuserModel == null
                ? 'กำลังดาวโหลดข้อมูล'
                : MyuserModel!.std_email),
          ],
        ),
      ),
    );
  }

  Container name_text() {
    return Container(
      decoration: decoration_text(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 10),
            Text('ชื่อ-นามสกุล   :'),
            SizedBox(width: 20),
            Text(MyuserModel == null
                ? 'กำลังดาวโหลดข้อมูล'
                : '${MyuserModel!.std_firstname}  ${MyuserModel!.std_lastname}'),
          ],
        ),
      ),
    );
  }

  Container std_id_text() {
    return Container(
      decoration: decoration_text(),
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(Icons.credit_card_rounded),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('รหัสนักศึกษา   :'),
          ),
          SizedBox(width: 20),
          Text(
              MyuserModel == null ? 'กำลังดาวโหลดข้อมูล' : MyuserModel!.std_id),
        ],
      ),
    );
  }

  BoxDecoration decoration_text() {
    return BoxDecoration(
      border: Border.all(width: 2, color: Colors.red),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }
}
