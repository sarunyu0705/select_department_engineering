import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/(P3)menu.dart';
import 'package:flutter_application_select_major/model/subject_model.dart';
import 'package:flutter_application_select_major/utility/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckGread extends StatefulWidget {
  const CheckGread({Key? key}) : super(key: key);

  @override
  State<CheckGread> createState() => _CheckGreadState();
}

int count_Click = 0;

class _CheckGreadState extends State<CheckGread> {
  List<MySubjectModel> _MySubjectModelList = [];
  MySubjectModel? _MySubjectModel_NoList;
  @override
  void initState() {
    super.initState();
    load_Subject_fromAPI();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ผลการเรียน'),
        actions: [
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
      body: Container(
          child: Column(
        children: [
          Container(
            height: 590,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _MySubjectModelList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                    'ชื่อวิชา(EN)  : ${_MySubjectModelList[index].subject_name_en}\nชื่อวิชา(TH)  : ${_MySubjectModelList[index].subject_name_th}\nรหัสวิชา  : ${_MySubjectModelList[index].subject_id}\nหน่วยกิต  : ${_MySubjectModelList[index].subject_credit}\nผลการเรียน  : ${_MySubjectModelList[index].subject_gread}\n'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          // --------------     เริ่ม   LISTVIWE 2 -------------------------------------------------//
          Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  'ผลการเรียนรวม',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                ),
                SizedBox(height: 15),
                Text(
                  'CR: ${_MySubjectModel_NoList?.cr}\t\t CP: ${_MySubjectModel_NoList?.cp} \t\t CA: ${_MySubjectModel_NoList?.ca} \t\t GP: ${_MySubjectModel_NoList?.gp} \t\t GA: ${_MySubjectModel_NoList?.gpa} \t\t GR: ${_MySubjectModel_NoList?.grade_rate}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

// ######################################################################//
// ##################    Start Method  ####################################//

  Future load_Subject_fromAPI() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? api_show_major =
        '${MyConstant.domain}/project/get_gread_subject_and_sum.php?isConnect=true&std_id=$std_id';
    await Dio().get(api_show_major).then((value) {
      print('ค่าต่างๆเกรด ==>> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          MySubjectModel model = MySubjectModel.fromMap(item);
          _MySubjectModelList.add(model);
        });
        setState(() {
          _MySubjectModel_NoList = MySubjectModel.fromMap(item);
        });
      }
    });
  }
}
