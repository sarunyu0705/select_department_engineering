import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_select_major/(P2)login.dart';
import 'package:flutter_application_select_major/utility/my_dialog.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

CarouselSlider imgslide = imgslide;
int changeImages = 0;
final List imgList = [
  'https://www.engineer.rmutt.ac.th/academicaffairs/wp-content/uploads/2021/02/2564-02-768x432.jpg',
  'https://www.engineer.rmutt.ac.th/academicaffairs/wp-content/uploads/2021/05/test-system2563.jpg',
  'https://www.engineer.rmutt.ac.th/academicaffairs/wp-content/uploads/2021/01/TCAS1-Portfolio2564-01-01-01.jpg',
  'https://www.engineer.rmutt.ac.th/academicaffairs/wp-content/uploads/2020/10/TQF2563-56-1-01.jpg'
];

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    print('ยินดีต้อนรับ');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าหลัก'),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    MyDialog().helperDialog(context, '', '');
                  }))
        ],
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          behavior: HitTestBehavior.opaque,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'ระบบการเลือกสาขาวิชา',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'คณะวิศวกรรมศาสตร์',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                '-ประกาศข่าวประชาสัมพันธ์-',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(height: 50),
              carouselSlid(),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text('เข้าสู่หน้าล็อคอิน'),
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

// ################################################################ //
// _______________________________ Method Widget Start______________//

  CarouselSlider carouselSlid() {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        autoPlay: true,
      ),
      items: imgList
          .map((imgurl) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.network(
                      imgurl,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
