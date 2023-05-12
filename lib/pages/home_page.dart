import 'dart:async';
import 'dart:math';

import 'package:alazaan/model/get_model.dart';
import 'package:alazaan/pages/dua_page.dart';
import 'package:alazaan/pages/qibla_screen.dart';
import 'package:alazaan/pages/quran_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alazaan/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final timeCont = Get.find<TimeModelView>(tag: 'time');

  void updateTimeAllTime() async {
    DateTime now = DateTime.now();

    while (true) {
      timeCont.currentTime.value = DateFormat.Hm().format(DateTime.now());

      DateFormat dateFormat = DateFormat.Hm();

      if (DateTime.now().isBefore(DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(timeCont.fujr.value.substring(0, 2)),
          int.parse(timeCont.fujr.value.substring(3, 5))))) {
        final diff = DateTime(
                now.year,
                now.month,
                now.day,
                int.parse(timeCont.fujr.value.substring(0, 2)),
                int.parse(timeCont.fujr.value.substring(3, 5)))
            .difference(DateTime.now());
        timeCont.nextPrayer.value = 'Fajr ' +
            diff.inHours.toString() +
            ' hour ' +
            diff.inMinutes.remainder(60).toString() +
            ' min left';
      } else if (DateTime.now().isBefore(DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(timeCont.dzuhr.value.substring(0, 2)),
          int.parse(timeCont.dzuhr.value.substring(3, 5))))) {
        final diff = DateTime(
                now.year,
                now.month,
                now.day,
                int.parse(timeCont.dzuhr.value.substring(0, 2)),
                int.parse(timeCont.dzuhr.value.substring(3, 5)))
            .difference(DateTime.now());
        timeCont.nextPrayer.value = 'Dzuhr ' +
            diff.inHours.toString() +
            ' hour ' +
            diff.inMinutes.remainder(60).toString() +
            ' min left';
      } else if (DateTime.now().isBefore(DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(timeCont.asr.value.substring(0, 2)),
          int.parse(timeCont.asr.value.substring(3, 5))))) {
        final diff = DateTime(
                now.year,
                now.month,
                now.day,
                int.parse(timeCont.asr.value.substring(0, 2)),
                int.parse(timeCont.asr.value.substring(3, 5)))
            .difference(DateTime.now());
        timeCont.nextPrayer.value = 'Asr ' +
            diff.inHours.toString() +
            ' hour ' +
            diff.inMinutes.remainder(60).toString() +
            ' min left';
      } else if (DateTime.now().isBefore(DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(timeCont.magrib.value.substring(0, 2)),
          int.parse(timeCont.magrib.value.substring(3, 5))))) {
        final diff = DateTime(
                now.year,
                now.month,
                now.day,
                int.parse(timeCont.magrib.value.substring(0, 2)),
                int.parse(timeCont.magrib.value.substring(3, 5)))
            .difference(DateTime.now());
        timeCont.nextPrayer.value = 'Maghrib ' +
            diff.inHours.toString() +
            ' hour ' +
            diff.inMinutes.remainder(60).toString() +
            ' min left';
      } else if (DateTime.now().isBefore(DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(timeCont.isha.value.substring(0, 2)),
          int.parse(timeCont.isha.value.substring(3, 5))))) {
        final diff = DateTime(
                now.year,
                now.month,
                now.day,
                int.parse(timeCont.isha.value.substring(0, 2)),
                int.parse(timeCont.isha.value.substring(3, 5)))
            .difference(DateTime.now());
        timeCont.nextPrayer.value = 'Isha ' +
            diff.inHours.toString() +
            ' hour ' +
            diff.inMinutes.remainder(60).toString() +
            ' min left';
      } else if (DateTime.now().isBefore(DateTime(
          now.year,
          now.month,
          now.add(Duration(days: 1)).day,
          int.parse(timeCont.fujr.value.substring(0, 2)),
          int.parse(timeCont.fujr.value.substring(3, 5))))) {
        final diff = DateTime(
                now.year,
                now.month,
                now.add(Duration(days: 1)).day,
                int.parse(timeCont.fujr.value.substring(0, 2)),
                int.parse(timeCont.fujr.value.substring(3, 5)))
            .difference(DateTime.now());
        timeCont.nextPrayer.value = 'Fajr ' +
            diff.inHours.toString() +
            ' hour ' +
            diff.inMinutes.remainder(60).toString() +
            ' min left';
      }
      await Future.delayed(Duration(seconds: 5));
    }
  }

  @override
  Widget build(BuildContext context) {
    updateTimeAllTime();
    return Scaffold(
      backgroundColor: cyan_bg,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        selectedItemColor: cyan_bg,
        iconSize: 25,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.handshake_rounded), label: 'Donation'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About Me'),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 210),
                Image.asset('assets/mosque3.png'),
              ],
            ),
            Column(
              children: [
                Container(
                  //Top Container
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                timeCont.ar_date.value,
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Kozhikode, Kerala',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                      SizedBox(height: 50),
                      Obx(() {
                        return Text(
                          timeCont.currentTime.value,
                          style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }),
                      Obx(() {
                        return Text(
                          timeCont.nextPrayer.value,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        );
                      }),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PrayerTimeContainer(
                              'Fajr', 'assets/fajr.png', timeCont.fujr.value),
                          PrayerTimeContainer('Dzuhr', 'assets/dzuhr.png',
                              timeCont.dzuhr.value),
                          PrayerTimeContainer(
                              'Asr', 'assets/asr.png', timeCont.asr.value),
                          PrayerTimeContainer('Maghrib', 'assets/magrib.png',
                              timeCont.magrib.value),
                          PrayerTimeContainer(
                              'Isha', 'assets/isha.png', timeCont.isha.value),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 5,
                            width: 100,
                            decoration: BoxDecoration(
                              color: cyan_bg,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  onTap: () => Get.to(() => QuranPage()),
                                  child: InsightContainer(
                                      'Quran', 'assets/quran.png')),
                              GestureDetector(
                                  onTap: () => Get.to(() => QiblahScreen()),
                                  child: InsightContainer(
                                      'Qibla', 'assets/compass.png')),
                              GestureDetector(
                                  onTap: () => Get.to(() => DuaPage()),
                                  child: InsightContainer(
                                      'Dua', 'assets/quote.png')),
                            ],
                          ),
                          Divider(height: 50, thickness: 1, color: Colors.grey),
                          Container(
                            height: 123,
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Text(
                                '~' + qoutes[Random.secure().nextInt(27)] + '~',
                                style: GoogleFonts.getFont(
                                    'Edu NSW ACT Foundation',
                                    fontSize: 28),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget PrayerTimeContainer(String prayer, String img, String time) {
  return Column(
    children: [
      Text(
        prayer,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      SizedBox(height: 10),
      Image.asset(img, height: 30, width: 30),
      SizedBox(height: 10),
      Text(
        time,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      )
    ],
  );
}

Widget InsightContainer(String title, String img) {
  return Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      color: cyan_bg,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          img,
          height: 50,
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        )
      ],
    ),
  );
}
