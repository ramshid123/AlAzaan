import 'package:alazaan/constants/colors.dart';
import 'package:alazaan/main.dart';
import 'package:alazaan/model/get_model.dart';
import 'package:alazaan/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final timeCont = Get.find<TimeModelView>(tag: 'time');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan_bg,
      body: Column(
        children: [
          Expanded(child: SizedBox(height: 500)),
          Image.asset('assets/icon.png', height: 150, width: 150),
          SizedBox(height: 10),
          Text(
            'AlAzaan',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
          Image.asset('assets/mosque3.png'),
          Container(
            color: mosque_clr,
            height: 100,
            width: Get.width,
          )
        ],
      ),
    );
  }
}
