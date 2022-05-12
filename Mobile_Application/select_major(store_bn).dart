import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/(P3)menu.dart';
import 'package:flutter_application_select_major/menu/menu_SelectMajor/select_mail_sender.dart';
import 'package:flutter_application_select_major/menu/menu_SelectMajor/select_major(select_bn).dart';
import 'package:flutter_application_select_major/model/major_model.dart';
import 'package:flutter_application_select_major/utility/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Major_StoreBN extends StatefulWidget {
  const Major_StoreBN({Key? key}) : super(key: key);

  @override
  State<Major_StoreBN> createState() => _Major_StoreBNState();
}

int count_Click = 0;
MyMajorModel? majorModel;

class _Major_StoreBNState extends State<Major_StoreBN> {
  List<MyMajorModel> majorModelList = [];

  @override
  void initState() {
    super.initState();
    load_Major_fromAPI();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('การเลือกสาขาวิชา'),
        actions: [
          IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Major_SelectBN()));
              }),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Major_send_mail()));
              },
              icon: Icon(Icons.mail)),
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Menu()));
              }),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          itemCount: majorModelList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  show_major1(index),
                  SizedBox(height: 5),
                  show_major2(index),
                  SizedBox(height: 5),
                  show_major3(index),
                  SizedBox(height: 5),
                  show_major4(index),
                  SizedBox(height: 5),
                  show_major5(index),
                  SizedBox(height: 5),
                  show_major6(index),
                  SizedBox(height: 5),
                  show_major7(index),
                  SizedBox(height: 5),
                  show_major8(index),
                  SizedBox(height: 5),
                  show_major9(index),
                ],
              ),
            );
          }),
    );
  }

// ######################################################################//
// ##################    Start Method  ####################################//
  Card show_major1(int index) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading:
            Image.asset('images/Number/number1.png', width: 40, height: 40),
        title: Text(majorModelList[index].major_1),
        subtitle: Text('สาขาลำดับที่ :  1'),
      ),
    );
  }

  Card show_major2(int index) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading:
            Image.asset('images/Number/number2.png', width: 40, height: 40),
        title: Text(majorModelList[index].major_2),
        subtitle: Text('สาขาลำดับที่ :  2'),
      ),
    );
  }

  Card show_major3(int index) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading:
            Image.asset('images/Number/number3.png', width: 40, height: 40),
        title: Text(majorModelList[index].major_3),
        subtitle: Text('สาขาลำดับที่ :  3'),
      ),
    );
  }

  Card show_major4(int index) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading:
            Image.asset('images/Number/number4.png', width: 40, height: 40),
        title: Text(majorModelList[index].major_4),
        subtitle: Text('สาขาลำดับที่ :  4'),
      ),
    );
  }

  Card show_major5(int index) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading:
            Image.asset('images/Number/number5.png', width: 40, height: 40),
        title: Text(majorModelList[index].major_5),
        subtitle: Text('สาขาลำดับที่ :  5'),
      ),
    );
  }

  Card show_major6(int index) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading:
            Image.asset('images/Number/number6.png', width: 40, height: 40),
        title: Text(majorModelList[index].major_6),
        subtitle: Text('สาขาลำดับที่ :  6'),
      ),
    );
  }

  Card show_major7(int index) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading:
            Image.asset('images/Number/number7.png', width: 40, height: 40),
        title: Text(majorModelList[index].major_7),
        subtitle: Text('สาขาลำดับที่ :  7'),
      ),
    );
  }

  Card show_major8(int index) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading:
            Image.asset('images/Number/number8.png', width: 40, height: 40),
        title: Text(majorModelList[index].major_8),
        subtitle: Text('สาขาลำดับที่ :  8'),
      ),
    );
  }

  Card show_major9(int index) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading:
            Image.asset('images/Number/number9.png', width: 40, height: 40),
        title: Text(majorModelList[index].major_9),
        subtitle: Text('สาขาลำดับที่ :  9'),
      ),
    );
  }

  Card show_major10(int index) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading:
            Image.asset('images/Number/number10.png', width: 40, height: 40),
        title: Text(majorModelList[index].major_10),
        subtitle: Text('สาขาลำดับที่ :  10'),
      ),
    );
  }

  Card show_major11(int index) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading:
            Image.asset('images/Number/number11.png', width: 40, height: 40),
        title: Text(majorModelList[index].major_11),
        subtitle: Text('สาขาลำดับที่ :  11'),
      ),
    );
  }

  Card show_major12(int index) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading:
            Image.asset('images/Number/number12.png', width: 40, height: 40),
        title: Text(majorModelList[index].major_12),
        subtitle: Text('สาขาลำดับที่ :  12'),
      ),
    );
  }

  Future load_Major_fromAPI() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    String? api_show_major =
        '${MyConstant.domain}/project/get_selectMajor.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard';
    await Dio().get(api_show_major).then((value) {
      print('name major ==>> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          MyMajorModel model = MyMajorModel.fromMap(item);
          majorModelList.add(model);
        });
      }
    });
  }
}
