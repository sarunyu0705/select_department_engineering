import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/(P3)menu.dart';
import 'package:flutter_application_select_major/model/user_model.dart';
import 'package:flutter_application_select_major/utility/my_constant.dart';
import 'package:flutter_application_select_major/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

bool stateRedeye = true; // กำหนดค่า Show/hide Password//
int valueRadio = 0; // กำหนดค่าเลือก RadioButton =0 //
final formkey = GlobalKey<FormState>();
TextEditingController idController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final snackBar_noaway = SnackBar(
  content: Text(
    'กรุณากรอกข้อมูลให้ครบถ้วน',
    style: TextStyle(color: Colors.black),
  ),
  backgroundColor: Colors.yellow,
);
final snackBar_noselect = SnackBar(
  content: Text(
    'กรุณาเลือกประเภทการล็อคอิน',
    style: TextStyle(color: Colors.black),
  ),
  backgroundColor: Colors.yellow,
);
final snackBar_userfalse = SnackBar(
  content: Text(
    'รหัสประจำตัวนักศึกษาผิด',
    style: TextStyle(color: Colors.black),
  ),
  backgroundColor: Colors.red,
); // snackbar text //
final snackBar_idcard_false = SnackBar(
  content: Text(
    'รหัสบัตรประจำตัวประชาชนผิด',
    style: TextStyle(color: Colors.black),
  ),
  backgroundColor: Colors.red,
);
final snackBar_passfalse = SnackBar(
  content: Text(
    'รหัสประจำตัวหรือรหัสผ่านผิด',
    style: TextStyle(color: Colors.black),
  ),
  backgroundColor: Colors.red,
);
final snackBar_succes = SnackBar(
  content: Text(
    'ล็อคอินสำเร็จ',
    style: TextStyle(color: Colors.black),
  ),
  backgroundColor: Colors.green,
);

class _LoginState extends State<Login> {
  MyUserModel? myUserModel;
  @override
  void initState() {
    super.initState();
    print('เข้าสู่หน้าล็อคอิน');
    prefer_type1();
    prefer_type2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ล็อคอิน'),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        // Close ปุ่มBackForward NajaEiEi
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    MyDialog().helperDialog(context, '', '');
                  }))
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              pictrueHeader(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                              alignment: Alignment
                                  .topLeft, // จัด POSITTION ของ Object //
                              child: text_header1()),
                          SizedBox(height: 5),
                          textff_user(),
                          SizedBox(height: 15),
                          Container(
                            alignment: Alignment.topLeft,
                            child: text_header2(),
                          ),
                          SizedBox(height: 5),
                          textff_password(),
                          SizedBox(height: 30),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 52),
                              radioID(),
                              Icon(Icons.credit_card),
                              SizedBox(width: 10),
                              Text('รหัสนักศึกษา'),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              radioPerple(),
                              Icon(Icons.person),
                              SizedBox(width: 10),
                              Text('รหัสประจำตัวประชาชน'),
                            ],
                          ),
                          SizedBox(height: 20)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              login_button(),
            ],
          ),
        ),
      ),
    );
  }

  //#######################################################################################################################//
  //_______________      เริ่มเก็บ Method     _______________//

  ElevatedButton login_button() {
    return ElevatedButton(
      child: Text('ล็อคอิน'),
      style: ElevatedButton.styleFrom(primary: Colors.red),
      onPressed: () {
        // เงื่อนไข (conditions validate กรอกข้อมูล && เลือกประเภท)//
        if (formkey.currentState!.validate() && valueRadio == 1) {
          String std_id = idController.text; // value ของ textfiled id//
          String std_password =
              passwordController.text; // value ของ textfiled password//
          print('### student ==>> $std_id, password => $std_password');
          print('### ประเภทล็อคอิน ==>>$valueRadio');
          print('### สถานะบัญชี ==>>$valueRadio');
          login_type1(std_id: std_id, std_password: std_password);
        }
        // เงื่อนไข (conditions validate กรอกข้อมูล && เลือกประเภท)//
        else if (formkey.currentState!.validate() && valueRadio == 2) {
          String std_idcard = idController.text; // value ของ textfiled id//
          String std_password =
              passwordController.text; // value ของ textfiled ps//
          print('### student ==>> $std_idcard, password => $std_password');
          print('### ประเภทล็อคอิน$valueRadio');
          login_type2(std_idcard: std_idcard, std_password: std_password);
        } else if (formkey.currentState!.validate() && valueRadio == 0) {
          print('ไม่เลือกประเภท');
          ScaffoldMessenger.of(context).showSnackBar(snackBar_noselect);
        }
        // เงื่อนไข (conditions validate ไม่กรอกข้อมูล && ไม่เลือกประเภท)//
        else {
          print('ไม่เลือกอะไรเลย');
          ScaffoldMessenger.of(context).showSnackBar(snackBar_noaway);
        }
      },
    );
  }

// ############################# Set Futrue กันใหม่โว้ยยย ####################//
  Future login_type1(
      {String? std_id, String? std_password, String? std_state}) async {
    String? api_std_id =
        '${MyConstant.domain}/project/get_std_id.php?isConnect=true&std_id=$std_id';
    await Dio().get(api_std_id).then((value) async {
      print('#### value for Api ==>> $value');
      if (value.toString() == 'null') {
        ScaffoldMessenger.of(context).showSnackBar(snackBar_userfalse);
      } else {
        for (var item in json.decode(value.data)) {
          MyUserModel model = MyUserModel.fromMap(item); //**//
          if (model.std_state == 'เปิดใช้งาน') {
            // ifelse สถานะ บัญชี
            if (std_password == model.std_password) {
              String? std_id = model.std_id;
              String? std_state = model.std_state;
              print('## UserID ==>> $std_id $std_state');
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.setString('std_id', std_id);
              preferences.setString('std_password', model.std_password);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Menu()));
              ScaffoldMessenger.of(context).showSnackBar(snackBar_succes);

              // #### Succes Login ####//
            } else {
              // #### False Login ####//
              ScaffoldMessenger.of(context).showSnackBar(snackBar_passfalse);
            }
          } else if (model.std_state == 'ระงับบัญชี'){
            print('บัญชีถูกระงับ');
            MyDialog().account_disable(context, 'title', 'message');
          }
        }
      }
    });
  }

  Future login_type2(
      {String? std_idcard, String? std_password, String? std_state}) async {
    String api_std_idcard =
        '${MyConstant.domain}/project/get_preple_id.php?isConnect=true&std_idcard=$std_idcard';
    await Dio().get(api_std_idcard).then((value) async {
      print('#### value for Api ==>> $value');
      if (value.toString() == 'null') {
        ScaffoldMessenger.of(context).showSnackBar(snackBar_userfalse);
      } else {
        for (var item in json.decode(value.data)) {
          MyUserModel model = MyUserModel.fromMap(item); //**//
          if (model.std_state == 'เปิดใช้งาน') {
            // ifelse สถานะ บัญชี
            if (std_password == model.std_password) {
              String? std_idcard = model.std_idcard;
              String? std_state = model.std_state;
              print('## สถานะ ==>> $std_state');
              print('## UserID ==>> $std_idcard');
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.setString('std_idcard', std_idcard);
              preferences.setString('std_password', model.std_password);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Menu()));
              ScaffoldMessenger.of(context).showSnackBar(snackBar_succes);
              // #### Succes Login ####//
            } else {
              // #### False Login ####//
              ScaffoldMessenger.of(context).showSnackBar(snackBar_passfalse);
            }
          } else if (model.std_state == 'ระงับบัญชี'){
            print('บัญชีถูกระงับ');
            MyDialog().account_disable(context, 'title', 'message');
          }
        }
      }
    });
  }

// ####################   Set Futrue กันใหม่โว้ยยย ####################//
  Future<Null> prefer_type1() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    if (std_id?.isEmpty ?? true) {
      print('##ไม่มีการล็อคอิน ID Studen ==>> $std_id');
    } else {
      print('## มีการล็อคอิน ID Studen ==>> $std_id');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Menu()));
    }
  }

  Future<Null> prefer_type2() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_idcard = prefer.getString('std_idcard');
    if (std_idcard?.isEmpty ?? true) {
      print('##ไม่มีการล็อคอิน ID บัตรประชาชน ==>> $std_idcard');
    } else {
      print('## มีการล็อคอิน ID บัตรประชาชน ==>> $std_idcard');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Menu()));
    }
  }

  Text text_header2() {
    return Text("รหัสผ่าน",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }

  Text text_header1() {
    return Text("รหัสประจำตัวนักศึกษา",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }

  TextFormField textff_user() {
    return TextFormField(
      controller: idController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณากรอกรหัสประจำตัวนักศึกษา';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'กรุณาใส่รหัสประจำตัวนักศึกษา',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.red, width: 2)),
      ),
    );
  }

  TextFormField textff_password() {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณากรอกรหัสผ่าน';
        } else {
          return null;
        }
      },
      obscureText: stateRedeye,
      decoration: InputDecoration(
          hintText: 'กรุณาใส่รหัสผ่าน',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.red, width: 2)),
          suffixIcon: IconButton(
            //  จำไว้เสมอว่า ? คือ True : false สามารถ setstate ได้//
            icon: stateRedeye
                ? Icon(Icons.remove_red_eye_outlined)
                : Icon(Icons.remove_red_eye),
            //  จำไว้เสมอว่า ? คือ True : false สามารถ setstate ได้//
            onPressed: () {
              setState(() {
                stateRedeye = !stateRedeye;
              });
            },
          )),
    );
  }

  Radio radioID() {
    return Radio(
      value: 1,
      groupValue: valueRadio,
      onChanged: (value) {
        setState(() {
          valueRadio = value;
        });
      },
    );
  }

  Radio radioPerple() {
    return Radio(
        value: 2,
        groupValue: valueRadio,
        onChanged: (value) {
          setState(() {
            valueRadio = value;
          });
        });
  }

  Image pictrueHeader() {
    return Image.asset('images/Department.png');
  }
}
