

import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/(P3)menu.dart';
import 'package:flutter_application_select_major/model/major_model.dart';
import 'package:flutter_application_select_major/model/static_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Static_thsiyear extends StatefulWidget {
  const Static_thsiyear({Key? key}) : super(key: key);

  @override
  State<Static_thsiyear> createState() => _Static_thsiyearState();
}
MyStaticModel? mystaticModel;
MyMajorModel? majorModel;


class allStudent {
  final String Major;
  final int sum;
  allStudent(this.Major, this.sum);
}

List<allStudent> getChartData() {
  final List<allStudent> chartData = [
    allStudent('โยธา', 39),
    allStudent('สิ่งแวดล้อม', 18),
    allStudent('ไฟฟ้า', 25),
    allStudent('เครื่องกล', 32),
    allStudent('อุตสาหการ', 49),
    allStudent('สิ่งทอ', 8),
    allStudent('อิเล็กทรอนิกส์', 69),
    allStudent('คอมพิวเตอร์', 22),
    allStudent('เคมี', 6),
    allStudent('วัสดุ', 5),
    allStudent('เกษตรอุตสาหกรรม', 21),
    allStudent('ชลประทานและการจัดการน้ำ', 31),
    allStudent('อาหาร', 23)
  ];
  return chartData;
}

class _Static_thsiyearState extends State<Static_thsiyear> {
  late List<allStudent> _chartData;
  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
    // show_static();
    // getChartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สถิติการเลือกสาขา'),
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
      body: SfCircularChart(
        title:
            ChartTitle(text: 'สถิติการเลือกสาขาของนักศึกษา\nปีการศึกษา 2563',textStyle: TextStyle(fontSize: 14)),
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        series: [
          PieSeries<allStudent, String>(
              dataSource: _chartData,
              xValueMapper: (allStudent data, _) => data.Major,
              yValueMapper: (allStudent data, _) => data.sum,
              dataLabelSettings: DataLabelSettings(isVisible: true)),
              
        ],
      ),
    );
  }
  //   Future show_static() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   String apiprofile =
  //       '${MyConstant.domain}/select_major/API_Static/get_Static_64.php?isConnect=true';
  //   await Dio().get(apiprofile).then((value) {
  //     // then แปลว่า "แล้ว" ใช้ต่อจากคำสั่งบางตัว //
  //     print('## ===>> $value');
  //     for (var item in json.decode(value.data)) {
  //       setState(() {
  //         print(item);
  //         mystaticModel = MyStaticModel.fromMap(item);
  //         print( 'xxxxxxstaticModel = $mystaticModel');
  //         print('${mystaticModel?.major_1_qty}');
  //       });
  //     }
  //   });
  // }
}