import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/menu/menu_SelectMajor/select_major(store_bn).dart';
import 'package:flutter_application_select_major/utility/my_constant.dart';
import 'package:flutter_application_select_major/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Major_SelectBN extends StatefulWidget {
  const Major_SelectBN({Key? key}) : super(key: key);

  @override
  State<Major_SelectBN> createState() => _Major_SelectBNState();
}

// value List show Data//
List majorModelList = []; // value List show Data//
int count_Click = 0; // value Count click //
bool stateIcon_selectmajor4 = true;
bool stateIcon_selectmajor5 = true;
bool stateIcon_selectmajor6 = true;
bool stateIcon_selectmajor7 = true;
bool stateIcon_selectmajor8 = true;
bool stateIcon_selectmajor9 = true;
bool stateIcon_selectmajor10 = true;
bool stateIcon_selectmajor11 = true;
bool stateIcon_selectmajor12 = true;

class _Major_SelectBNState extends State<Major_SelectBN> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('การเลือกสาขา'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        actions: [
          Reselct_button(),
          home(),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              listtile_major4(),
              SizedBox(height: 5),
              listtile_major5(),
              SizedBox(height: 5),
              listtile_major6(),
              SizedBox(height: 5),
              listtile_major7(),
              SizedBox(height: 5),
              listtile_major8(),
              SizedBox(height: 5),
              listtile_major9(),
              SizedBox(height: 5),
              listtile_major10(),
              SizedBox(height: 5),
              listtile_major11(),
              SizedBox(height: 5),
              listtile_major12(),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
// ####################################################################### //
// ####################################################################### //
// _______________      Start Method    _________________________________ //

  IconButton home() {
    return IconButton(
        icon: Icon(Icons.assignment),
        onPressed: () {
          if (count_Click == 9) {
            //ตรวจเงือนไขก่อนออกไป Store
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Major_StoreBN()));
          } else {
            print('ยังเลือกสาขาไม่ครบ');
            MyDialog().major_no_full(context, 'title', 'message');
          }
        });
  }

  IconButton Reselct_button() {
    return IconButton(
        onPressed: () {
          count_Click = 0;
          setState(() {
            if (!stateIcon_selectmajor4) {
              stateIcon_selectmajor4 = !stateIcon_selectmajor4;
            }
            if (!stateIcon_selectmajor5) {
              stateIcon_selectmajor5 = !stateIcon_selectmajor5;
            }
            if (!stateIcon_selectmajor6) {
              stateIcon_selectmajor6 = !stateIcon_selectmajor6;
            }
            if (!stateIcon_selectmajor7) {
              stateIcon_selectmajor7 = !stateIcon_selectmajor7;
            }
            if (!stateIcon_selectmajor8) {
              stateIcon_selectmajor8 = !stateIcon_selectmajor8;
            }
            if (!stateIcon_selectmajor9) {
              stateIcon_selectmajor9 = !stateIcon_selectmajor9;
            }
            if (!stateIcon_selectmajor10) {
              stateIcon_selectmajor10 = !stateIcon_selectmajor10;
            }
            if (!stateIcon_selectmajor11) {
              stateIcon_selectmajor11 = !stateIcon_selectmajor11;
            }
            if (!stateIcon_selectmajor12) {
              stateIcon_selectmajor12 = !stateIcon_selectmajor12;
            }
          });
          print("รีเซ็ตการเลือก $count_Click");
        },
        icon: Icon(Icons.restart_alt_sharp));
  }

  Card listtile_major4() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: ListTile(
        leading:
            Image.asset('images/SelMajor/machine.png', width: 50, height: 50),
        title: Text('วิศวกรรมเครื่องกล'),
        subtitle: Text('รหัสสาขาวิชา : 1304'),
        trailing: IconButton(
            onPressed: () {
              count_Click++;
              update_major_Mechanical();
              if (count_Click <= 9) {
                print(
                    'เลือกวิศวกรรมเครื่องกล' + 'เป็นสาขาที่  ' '$count_Click');
                setState(() {
                  stateIcon_selectmajor4 = !stateIcon_selectmajor4;
                });
              }
            },
            icon: stateIcon_selectmajor4
                ? Icon(Icons.add_circle_outline_sharp)
                : Icon(Icons.task_alt_sharp, color: Colors.green)),
      ),
    );
  }

  Card listtile_major5() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: ListTile(
        leading: Image.asset('images/SelMajor/industrial.png',
            width: 50, height: 50),
        title: Text('วิศวกรรมอุตสาหการ\nระบบการผลิตอัตโนมัติ'),
        subtitle: Text('รหัสสาขาวิชา : 1305'),
        trailing: IconButton(
            onPressed: () {
              count_Click++;
              update_major_Industrial_Auto();
              if (count_Click <= 9) {
                print('เลือกวิศวกรรมอุตสาหการ\nระบบการผลิตอัตโนมัติ' +
                    'เป็นสาขาที่  ' '$count_Click');
                setState(() {
                  stateIcon_selectmajor5 = !stateIcon_selectmajor5;
                });
              }
            },
            icon: stateIcon_selectmajor5
                ? Icon(Icons.add_circle_outline_sharp)
                : Icon(Icons.task_alt_sharp, color: Colors.green)),
      ),
    );
  }

  Card listtile_major6() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: ListTile(
        leading:
            Image.asset('images/SelMajor/cloth.png', width: 50, height: 50),
        title: Text('วิศวกรรมนวัตกรรมสิ่งทอ'),
        subtitle: Text('รหัสสาขาวิชา : 1306'),
        trailing: IconButton(
            onPressed: () {
              count_Click++;
              update_major_Textile();
              if (count_Click <= 9) {
                print('เลือกวิศวกรรมนวัตกรรมสิ่งทอ' +
                    'เป็นสาขาที่  ' '$count_Click');
                setState(() {
                  stateIcon_selectmajor6 = !stateIcon_selectmajor6;
                });
              }
            },
            icon: stateIcon_selectmajor6
                ? Icon(Icons.add_circle_outline_sharp)
                : Icon(Icons.task_alt_sharp, color: Colors.green)),
      ),
    );
  }

  Card listtile_major7() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: ListTile(
        leading: Image.asset('images/SelMajor/electronic.png',
            width: 50, height: 50),
        title: Text('วิศวกรรมอิเล็กทรอนิกส์\nและโทรคมนาคม'),
        subtitle: Text('รหัสสาขาวิชา : 1307'),
        trailing: IconButton(
            onPressed: () {
              count_Click++;
              update_major_Electronic();
              if (count_Click <= 9) {
                print('วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม' +
                    'เป็นสาขาที่  ' '$count_Click');
                setState(() {
                  stateIcon_selectmajor7 = !stateIcon_selectmajor7;
                });
              }
            },
            icon: stateIcon_selectmajor7
                ? Icon(Icons.add_circle_outline_sharp)
                : Icon(Icons.task_alt_sharp, color: Colors.green)),
      ),
    );
  }

  Card listtile_major8() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: ListTile(
        leading:
            Image.asset('images/SelMajor/computer.png', width: 50, height: 50),
        title: Text('วิศวกรรมคอมพิวเตอร์'),
        subtitle: Text('รหัสสาขาวิชา : 1308'),
        trailing: IconButton(
            onPressed: () {
              count_Click++;
              update_major_Computer();
              if (count_Click <= 9) {
                print('เลือกวิศวกรรมคอมพิวเตอร์' +
                    'เป็นสาขาที่  ' '$count_Click');
                setState(() {
                  stateIcon_selectmajor8 = !stateIcon_selectmajor8;
                });
              }
            },
            icon: stateIcon_selectmajor8
                ? Icon(Icons.add_circle_outline_sharp)
                : Icon(Icons.task_alt_sharp, color: Colors.green)),
      ),
    );
  }

  Card listtile_major9() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: ListTile(
        leading:
            Image.asset('images/SelMajor/chemical.png', width: 50, height: 50),
        title: Text('วิศวกรรมเคมี'),
        subtitle: Text('รหัสสาขาวิชา : 1309'),
        trailing: IconButton(
            onPressed: () {
              count_Click++;
              update_major_Chemical();
              if (count_Click <= 9) {
                print('เลือกวิศวกรรมเคมี' + 'เป็นสาขาที่  ' '$count_Click');
                setState(() {
                  stateIcon_selectmajor9 = !stateIcon_selectmajor9;
                });
              }
            },
            icon: stateIcon_selectmajor9
                ? Icon(Icons.add_circle_outline_sharp)
                : Icon(Icons.task_alt_sharp, color: Colors.green)),
      ),
    );
  }

  Card listtile_major10() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: ListTile(
        leading:
            Image.asset('images/SelMajor/material.png', width: 50, height: 50),
        title: Text('วิศวกรรมพอลิเมอร์'),
        subtitle: Text('รหัสสาขาวิชา : 13010'),
        trailing: IconButton(
            onPressed: () {
              count_Click++;
              update_major_Polymer();
              if (count_Click <= 9) {
                print(
                    'เลือกวิศวกรรมพอลิเมอร์' + 'เป็นสาขาที่  ' '$count_Click');
                setState(() {
                  stateIcon_selectmajor10 = !stateIcon_selectmajor10;
                });
              }
            },
            icon: stateIcon_selectmajor10
                ? Icon(Icons.add_circle_outline_sharp)
                : Icon(Icons.task_alt_sharp, color: Colors.green)),
      ),
    );
  }

  Card listtile_major11() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: ListTile(
        leading:
            Image.asset('images/SelMajor/logistic.png', width: 50, height: 50),
        title: Text('วิศวกรรมอุตสาหการ\nและโลจิสติกส์'),
        subtitle: Text('รหัสสาขาวิชา : 13011'),
        trailing: IconButton(
            onPressed: () {
              count_Click++;
              update_major_Logistic();
              if (count_Click <= 9) {
                print('วิศวกรรมอุตสาหการและ\nโลจิสติกส์' +
                    'เป็นสาขาที่  ' '$count_Click');
                setState(() {
                  stateIcon_selectmajor11 = !stateIcon_selectmajor11;
                });
              }
            },
            icon: stateIcon_selectmajor11
                ? Icon(Icons.add_circle_outline_sharp)
                : Icon(Icons.task_alt_sharp, color: Colors.green)),
      ),
    );
  }

  Card listtile_major12() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: ListTile(
        leading: Image.asset('images/SelMajor/food.png', width: 50, height: 50),
        title: Text(' วิศวกรรมอาหาร'),
        subtitle: Text('รหัสสาขาวิชา : 13013'),
        trailing: IconButton(
            onPressed: () {
              count_Click++;
              update_major_Food();
              if (count_Click <= 9) {
                print('เลือกวิศวกรรมอาหาร' + 'เป็นสาขาที่  ' '$count_Click');
                setState(() {
                  stateIcon_selectmajor12 = !stateIcon_selectmajor12;
                });
              }
            },
            icon: stateIcon_selectmajor12
                ? Icon(Icons.add_circle_outline_sharp)
                : Icon(Icons.task_alt_sharp, color: Colors.green)),
      ),
    );
  }
// ##################################################################################################################################//
// ##################################################################################################################################//
// ##################################################################################################################################//
//                          Start   Method            //

  //  อัพพเดทข้อมูล
  Future<Null> update_major_Mechanical() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    if (count_Click <= 9) {
      switch (count_Click) {
        case 1:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major1.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_1=วิศวกรรมเครื่องกล'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 1 วิศวกรรมเครื่องกล');
          });
          break;
        case 2:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major2.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_2=วิศวกรรมเครื่องกล'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 2 วิศวกรรมเครื่องกล');
          });
          break;
        case 3:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major3.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_3=วิศวกรรมเครื่องกล'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 3 วิศวกรรมเครื่องกล');
          });
          break;
        case 4:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major4.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_4=วิศวกรรมเครื่องกล'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 4 วิศวกรรมเครื่องกล');
          });
          break;
        case 5:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major5.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_5=วิศวกรรมเครื่องกล'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 5 วิศวกรรมเครื่องกล');
          });
          break;
        case 6:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major6.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_6=วิศวกรรมเครื่องกล'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 6 วิศวกรรมเครื่องกล');
          });
          break;
        case 7:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major7.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_7=วิศวกรรมเครื่องกล'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 7 วิศวกรรมเครื่องกล');
          });
          break;
        case 8:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major8.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_8=วิศวกรรมเครื่องกล'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 8 วิศวกรรมเครื่องกล');
          });
          break;
        case 9:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major9.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_9=วิศวกรรมเครื่องกล'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 9 วิศวกรรมเครื่องกล');
            succes_select_state();
          });
          break;
        default:
      }
    }
  }

  Future<Null> update_major_Industrial_Auto() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    if (count_Click <= 9) {
      switch (count_Click) {
        case 1:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major1.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_1=วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 1 วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ');
          });
          break;
        case 2:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major2.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_2=วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 2 วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ');
          });
          break;
        case 3:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major3.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_3=วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 3 วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ');
          });
          break;
        case 4:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major4.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_4=วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 4 วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ');
          });
          break;
        case 5:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major5.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_5=วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 5 วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ');
          });
          break;
        case 6:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major6.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_6=วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 6 วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ');
          });
          break;
        case 7:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major7.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_7=วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 7 วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ');
          });
          break;
        case 8:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major8.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_8=วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 8 วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ');
          });
          break;
        case 9:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major9.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_9=วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 9 วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ');
            succes_select_state();
          });
          break;
        case 10:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major10.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_10=วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 10 วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ');
          });
          break;
        case 11:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major11.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_11=วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 11 วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ');
          });
          break;
        case 12:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major12.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_12=วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 12 วิศวกรรมอุตสาหการระบบการผลิตอัตโนมัติ');
            succes_select_state();
          });
          break;
        default:
      }
    }
  }

  Future<Null> update_major_Textile() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    if (count_Click <= 9) {
      switch (count_Click) {
        case 1:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major1.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_1=วิศวกรรมนวัตกรรมสิ่งทอ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 1 วิศวกรรมนวัตกรรมสิ่งทอ');
          });
          break;
        case 2:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major2.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_2=วิศวกรรมนวัตกรรมสิ่งทอ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 2 วิศวกรรมนวัตกรรมสิ่งทอ');
          });
          break;
        case 3:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major3.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_3=วิศวกรรมนวัตกรรมสิ่งทอ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 3 วิศวกรรมนวัตกรรมสิ่งทอ');
          });
          break;
        case 4:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major4.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_4=วิศวกรรมนวัตกรรมสิ่งทอ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 4 วิศวกรรมนวัตกรรมสิ่งทอ');
          });
          break;
        case 5:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major5.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_5=วิศวกรรมนวัตกรรมสิ่งทอ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 5 วิศวกรรมนวัตกรรมสิ่งทอ');
          });
          break;
        case 6:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major6.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_6=วิศวกรรมนวัตกรรมสิ่งทอ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 6 วิศวกรรมนวัตกรรมสิ่งทอ');
          });
          break;
        case 7:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major7.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_7=วิศวกรรมนวัตกรรมสิ่งทอ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 7 วิศวกรรมนวัตกรรมสิ่งทอ');
          });
          break;
        case 8:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major8.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_8=วิศวกรรมนวัตกรรมสิ่งทอ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 8 วิศวกรรมนวัตกรรมสิ่งทอ');
          });
          break;
        case 9:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major9.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_9=วิศวกรรมนวัตกรรมสิ่งทอ'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 9 วิศวกรรมนวัตกรรมสิ่งทอ');
            succes_select_state();
          });
          break;
        default:
      }
    }
  }

  Future<Null> update_major_Electronic() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    if (count_Click <= 9) {
      switch (count_Click) {
        case 1:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major1.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_1=วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 1 วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม');
          });
          break;
        case 2:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major2.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_2=วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 2 วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม');
          });
          break;
        case 3:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major3.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_3=วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 3 วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม');
          });
          break;
        case 4:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major4.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_4=วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 4 วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม');
          });
          break;
        case 5:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major5.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_5=วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 5 วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม');
          });
          break;
        case 6:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major6.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_6=วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 6 วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม');
          });
          break;
        case 7:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major7.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_7=วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 7 วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม');
          });
          break;
        case 8:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major8.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_8=วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 8 วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม');
          });
          break;
        case 9:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major9.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_9=วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 9 วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม');
            succes_select_state();
          });
          break;
        default:
      }
    }
  }

  Future<Null> update_major_Computer() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    if (count_Click <= 9) {
      switch (count_Click) {
        case 1:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major1.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_1=วิศวกรรมคอมพิวเตอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 1 วิศวกรรมคอมพิวเตอร์');
          });
          break;
        case 2:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major2.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_2=วิศวกรรมคอมพิวเตอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 2 วิศวกรรมคอมพิวเตอร์');
          });
          break;
        case 3:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major3.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_3=วิศวกรรมคอมพิวเตอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 3 วิศวกรรมคอมพิวเตอร์');
          });
          break;
        case 4:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major4.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_4=วิศวกรรมคอมพิวเตอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 4 วิศวกรรมคอมพิวเตอร์');
          });
          break;
        case 5:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major5.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_5=วิศวกรรมคอมพิวเตอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 5 วิศวกรรมคอมพิวเตอร์');
          });
          break;
        case 6:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major6.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_6=วิศวกรรมคอมพิวเตอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 6 วิศวกรรมคอมพิวเตอร์');
          });
          break;
        case 7:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major7.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_7=วิศวกรรมคอมพิวเตอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 7 วิศวกรรมคอมพิวเตอร์');
          });
          break;
        case 8:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major8.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_8=วิศวกรรมคอมพิวเตอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 8 วิศวกรรมคอมพิวเตอร์');
          });
          break;
        case 9:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major9.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_9=วิศวกรรมคอมพิวเตอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 9 วิศวกรรมคอมพิวเตอร์');
            succes_select_state();
          });
          break;
        default:
      }
    }
  }

  Future<Null> update_major_Chemical() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    if (count_Click <= 9) {
      switch (count_Click) {
        case 1:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major1.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_1=วิศวกรรมเคมี'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 1 วิศวกรรมเคมี');
          });
          break;
        case 2:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major2.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_2=วิศวกรรมเคมี'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 2 วิศวกรรมเคมี');
          });
          break;
        case 3:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major3.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_3=วิศวกรรมเคมี'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 3 วิศวกรรมเคมี');
          });
          break;
        case 4:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major4.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_4=วิศวกรรมเคมี'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 4 วิศวกรรมเคมี');
          });
          break;
        case 5:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major5.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_5=วิศวกรรมเคมี'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 5 วิศวกรรมเคมี');
          });
          break;
        case 6:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major6.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_6=วิศวกรรมเคมี'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 6 วิศวกรรมเคมี');
          });
          break;
        case 7:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major7.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_7=วิศวกรรมเคมี'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 7 วิศวกรรมเคมี');
          });
          break;
        case 8:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major8.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_8=วิศวกรรมเคมี'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 8 วิศวกรรมเคมี');
          });
          break;
        case 9:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major9.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_9=วิศวกรรมเคมี'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 9 วิศวกรรมเคมี');
            succes_select_state();
          });
          break;
        default:
      }
    }
  }

  Future<Null> update_major_Polymer() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    if (count_Click <= 9) {
      switch (count_Click) {
        case 1:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major1.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_1=วิศวกรรมพอลิเมอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 1 วิศวกรรมพอลิเมอร์');
          });
          break;
        case 2:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major2.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_2=วิศวกรรมพอลิเมอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 2 วิศวกรรมพอลิเมอร์');
          });
          break;
        case 3:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major3.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_3=วิศวกรรมพอลิเมอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 3 วิศวกรรมพอลิเมอร์');
          });
          break;
        case 4:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major4.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_4=วิศวกรรมพอลิเมอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 4 วิศวกรรมพอลิเมอร์');
          });
          break;
        case 5:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major5.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_5=วิศวกรรมพอลิเมอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 5 วิศวกรรมพอลิเมอร์');
          });
          break;
        case 6:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major6.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_6=วิศวกรรมพอลิเมอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 6 วิศวกรรมพอลิเมอร์');
          });
          break;
        case 7:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major7.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_7=วิศวกรรมพอลิเมอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 7 วิศวกรรมพอลิเมอร์');
          });
          break;
        case 8:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major8.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_8=วิศวกรรมพอลิเมอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 8 วิศวกรรมพอลิเมอร์');
          });
          break;
        case 9:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major9.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_9=วิศวกรรมพอลิเมอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 9 วิศวกรรมพอลิเมอร์');
          });
          break;
        case 10:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major10.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_10=วิศวกรรมพอลิเมอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 10 วิศวกรรมพอลิเมอร์');
          });
          break;
        case 11:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major11.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_11=วิศวกรรมพอลิเมอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 11 วิศวกรรมพอลิเมอร์');
          });
          break;
        case 12:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major12.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_12=วิศวกรรมพอลิเมอร์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 12 วิศวกรรมพอลิเมอร์');
            succes_select_state();
          });
          break;
        default:
      }
    }
  }

  Future<Null> update_major_Logistic() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    if (count_Click <= 9) {
      switch (count_Click) {
        case 1:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major1.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_1=วิศวกรรมอุตสาหการและโลจิสติกส์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 1 วิศวกรรมอุตสาหการและโลจิสติกส์');
          });
          break;
        case 2:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major2.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_2=วิศวกรรมอุตสาหการและโลจิสติกส์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 2 วิศวกรรมอุตสาหการและโลจิสติกส์');
          });
          break;
        case 3:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major3.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_3=วิศวกรรมอุตสาหการและโลจิสติกส์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 3 วิศวกรรมอุตสาหการและโลจิสติกส์');
          });
          break;
        case 4:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major4.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_4=วิศวกรรมอุตสาหการและโลจิสติกส์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 4 วิศวกรรมอุตสาหการและโลจิสติกส์');
          });
          break;
        case 5:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major5.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_5=วิศวกรรมอุตสาหการและโลจิสติกส์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 5 วิศวกรรมอุตสาหการและโลจิสติกส์');
          });
          break;
        case 6:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major6.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_6=วิศวกรรมอุตสาหการและโลจิสติกส์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 6 วิศวกรรมอุตสาหการและโลจิสติกส์');
          });
          break;
        case 7:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major7.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_7=วิศวกรรมอุตสาหการและโลจิสติกส์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 7 วิศวกรรมอุตสาหการและโลจิสติกส์');
          });
          break;
        case 8:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major8.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_8=วิศวกรรมอุตสาหการและโลจิสติกส์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 8 วิศวกรรมอุตสาหการและโลจิสติกส์');
          });
          break;
        case 9:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major9.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_9=วิศวกรรมอุตสาหการและโลจิสติกส์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 9 วิศวกรรมอุตสาหการและโลจิสติกส์');
          });
          break;
        case 10:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major10.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_10=วิศวกรรมอุตสาหการและโลจิสติกส์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 10 วิศวกรรมอุตสาหการและโลจิสติกส์');
          });
          break;
        case 11:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major11.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_11=วิศวกรรมอุตสาหการและโลจิสติกส์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 11 วิศวกรรมอุตสาหการและโลจิสติกส์');
          });
          break;
        case 12:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major12.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_12=วิศวกรรมอุตสาหการและโลจิสติกส์'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 12 วิศวกรรมอุตสาหการและโลจิสติกส์');
            succes_select_state();
          });
          break;
        default:
      }
    }
  }

  Future<Null> update_major_Food() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    if (count_Click <= 9) {
      switch (count_Click) {
        case 1:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major1.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_1=วิศวกรรมอาหาร'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 1 วิศวกรรมอาหาร');
          });
          break;
        case 2:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major2.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_2=วิศวกรรมอาหาร'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 2 วิศวกรรมอาหาร');
          });
          break;
        case 3:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major3.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_3=วิศวกรรมอาหาร'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 3 วิศวกรรมอาหาร');
          });
          break;
        case 4:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major4.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_4=วิศวกรรมอาหาร'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 4 วิศวกรรมอาหาร');
          });
          break;
        case 5:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major5.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_5=วิศวกรรมอาหาร'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 5 วิศวกรรมอาหาร');
          });
          break;
        case 6:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major6.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_6=วิศวกรรมอาหาร'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 6 วิศวกรรมอาหาร');
          });
          break;
        case 7:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major7.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_7=วิศวกรรมอาหาร'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 7 วิศวกรรมอาหาร');
          });
          break;
        case 8:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major8.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_8=วิศวกรรมอาหาร'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 8 วิศวกรรมอาหาร');
          });
          break;
        case 9:
          String apiedit_major1 =
              '${MyConstant.domain}/select_major/API_Major/13major/update_major9.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&major_9=วิศวกรรมอาหาร'; // นำค่า $major_1 เป็นค่า text
          await Dio().get(apiedit_major1).then((value) {
            print('สาขา 9 วิศวกรรมอาหาร');
            succes_select_state();
          });
          break;
        default:
      }
    }
  }

  Future<Null> succes_select_state() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? std_major = prefer.getString('std_major');
    String? std_id = prefer.getString('std_id');
    String? std_idcard = prefer.getString('std_idcard');
    print(std_major);
    String major_update_state =
        '${MyConstant.domain}/select_major/API_Major/13major/update_major_state.php?isConnect=true&std_id=$std_id&std_idcard=$std_idcard&std_major=เลือกสาขาแล้ว';
    await Dio().get(major_update_state).then((value) {
      print('สถานะ  ==>>>${value}');
    });
  }
}
