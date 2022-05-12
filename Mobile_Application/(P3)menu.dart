import 'package:flutter/material.dart';
import 'package:flutter_application_select_major/(P2)login.dart';
import 'package:flutter_application_select_major/menu/menu_CheckGread/CheckGread.dart';
import 'package:flutter_application_select_major/menu/menu_ColorBilndness/colorbn(welcome).dart';
import 'package:flutter_application_select_major/menu/menu_SelectMajor/select_major(welcome).dart';
import 'package:flutter_application_select_major/menu/menu_Static/static_lastyear.dart';
import 'package:flutter_application_select_major/menu/menu_profile/viweprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('เมนูหลัก'),
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () async {
                  SharedPreferences prefer =
                      await SharedPreferences.getInstance();
                  prefer.clear().then((value) => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login())));
                },
                icon: Icon(Icons.logout))
          ],
          // Close BackForward NajaEiEi
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [menu1(), menu2(), menu3(), menu4(), menu5()],
        ));
  }

  menu1() {
    //  selectmajor//
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          // ตกแต่ง Box Menu//
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3,
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Major_Welcome()));
          },
          child: Column(
            children: [
              SizedBox(height: 20),
              Image.asset('images/selectMajor.jpg', height: 120, width: 120),
              SizedBox(height: 10),
              Text('เลือกสาขาวิชา'),
            ],
          ),
        ),
      ),
    );
  }

  menu2() {
    //   test bild //
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          // ตกแต่ง Box Menu//
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3,
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          // OnTap กด Comment ไว้ใส่ Function Check Status //
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => CBN_Welcome()));
          },
          child: Column(
            children: [
              SizedBox(height: 20),
              Image.asset('images/color_blindness.png',
                  height: 100, width: 100),
              SizedBox(height: 30),
              Text('ทดสอบตาบอดสี'),
            ],
          ),
        ),
      ),
    );
  }

  menu3() {
    // check gread//
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          // ตกแต่ง Box Menu//
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3,
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CheckGread()));
          },
          child: Column(
            children: [
              SizedBox(height: 20),
              Image.asset('images/Gread.png', height: 120, width: 120),
              SizedBox(height: 10),
              Text('ตรวจสอบเกรดเฉลี่ย'),
            ],
          ),
        ),
      ),
    );
  }

  menu4() {
    // static//
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          // ตกแต่ง Box Menu//
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3,
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Static_thsiyear()));
          },
          child: Column(
            children: [
              SizedBox(height: 20),
              Image.asset('images/Static.png', height: 120, width: 120),
              SizedBox(height: 10),
              Text('สถิติการเลือกสาขา'),
            ],
          ),
        ),
      ),
    );
  }

  menu5() {
    // profile//
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          // ตกแต่ง Box Menu//
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3,
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ViweProfile()));
          },
          child: Column(
            children: [
              SizedBox(height: 20),
              Image.asset('images/Profile.png', height: 120, width: 120),
              SizedBox(height: 10),
              Text('ข้อมูลนักศึกษา'),
            ],
          ),
        ),
      ),
    );
  }
  // ###########################################################//
  // ####################   Strat Method    ####################//
}
