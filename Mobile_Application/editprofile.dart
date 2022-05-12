import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/menu/menu_profile/viweprofile.dart';
import 'package:flutter_application_select_major/model/user_model.dart';
import 'package:flutter_application_select_major/utility/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

MyUserModel? myUserModel;
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController telController = TextEditingController();

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    super.initState();
    showUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขข้อมูล'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'ชื่อนักศึกษา',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: telController,
                decoration: InputDecoration(
                  labelText: 'เบอร์โทรนักศึกษา',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                maxLines: 2,
                decoration: InputDecoration(
                    labelText: 'อีเมลนักศึกษา', enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),),
              ),
              ElevatedButton(onPressed: (){
                print('## ==>> value edit to database');
                editProfile();
              }, child: Text('บันทึกการเปลี่ยนแปลงข้อมูล'))
            ],
          ),
        ),
      ),
    );
  }

  // ##################################################################//
//########################    Start Method  ##########################//
  Future showUser() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String apiGetUser =
        '${MyConstant.domain}/project/get_profile.php?isConnect=true&std_id=$std_id';
    await Dio().get(apiGetUser).then((value) {
      print('value from API ==>>> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          myUserModel = MyUserModel.fromMap(item);
          nameController.text = '${MyuserModel!.std_firstname}  ${MyuserModel!.std_lastname}';
          telController.text = MyuserModel!.std_tel;
          emailController.text = MyuserModel!.std_email;
        });
      }
    });
  }

  Future<Null> editProfile() async {
    String apieditProfile =
        '${MyConstant.domain}/project/update_profile.php?isAdd=true&std_id=${MyuserModel!.std_id}&std_name=${nameController.text}&std_tel=${telController.text}&std_email=${emailController.text}';
    await Dio().get(apieditProfile).then((value) => Navigator.pop(context));
  }
}
