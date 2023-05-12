import 'dart:io';
import 'dart:typed_data';

import 'package:alazaan/constants/colors.dart';
import 'package:alazaan/model/prayer_time_model.dart';
import 'package:alazaan/model/get_model.dart';
import 'package:alazaan/pages/dua_page.dart';
import 'package:alazaan/pages/home_page.dart';
import 'package:alazaan/pages/splash_page.dart';
import 'package:alazaan/pages/quran_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ByteData data =
      await PlatformAssetBundle().load('assets/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final timeCont = Get.put(TimeModelView(), tag: 'time', permanent: true);
  final quranCont = Get.put(QuranView(), tag: 'quran', permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Al Azaan',
      home: SplashPage(),
    );
  }
}

Future initTimes() async {
  try {
    final timeCont = Get.find<TimeModelView>(tag: 'time');

    final todayDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

    final dateResponse = await http.get(Uri.parse(
        'https://api.aladhan.com/v1/timingsByCity/' +
            todayDate +
            '?city=Kozhikode&country=India&method=1'));
    final dateJson = AzaanModel.fromRawJson(dateResponse.body);

    timeCont.fujr.value = dateJson.data.timings.fajr;
    timeCont.dzuhr.value = dateJson.data.timings.dhuhr;
    timeCont.asr.value = dateJson.data.timings.asr;
    timeCont.magrib.value = dateJson.data.timings.maghrib;
    timeCont.isha.value = dateJson.data.timings.isha;

    timeCont.ar_date.value = dateJson.data.date.hijri.day +
        ' ' +
        dateJson.data.date.hijri.month.en +
        ' ' +
        dateJson.data.date.hijri.year +
        ' H';
    Get.off(() => DuaPage());
  } catch (e) {
    print(e);
    if (e.toString().contains('Failed host lookup')) {
      Get.showSnackbar(GetSnackBar(
        margin: EdgeInsets.all(10),
        borderRadius: 10,
        messageText: IconButton(
          onPressed: (){
            Get.back();
            initTimes();},
          icon: Icon(Icons.refresh_rounded,color: cyan_bg,size: 30),
        ),
        titleText: Text(
          'No Internet',
          style: TextStyle(
              color: cyan_bg, fontWeight: FontWeight.bold, fontSize: 25),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
      ));
    }
  }
}
