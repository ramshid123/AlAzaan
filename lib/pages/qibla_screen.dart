import 'dart:math';

import 'package:alazaan/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahScreenState extends State<QiblahScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    getPermission();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  bool hasPermission = false;

  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        setState(() {
          hasPermission = true;
        });
      } else {
        Permission.location.request().then((value) {
          setState(() {
            hasPermission = (value == PermissionStatus.granted);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return hasPermission
        ? Scaffold(
            backgroundColor: cyan_bg,
            body: SafeArea(
              child: StreamBuilder(
                stream: FlutterQiblah.qiblahStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ));
                  }

                  final qiblahDirection = snapshot.data;
                  animation = Tween(
                          begin: begin,
                          end: (qiblahDirection!.qiblah * (pi / 180) * -1))
                      .animate(_animationController!);
                  begin = (qiblahDirection.qiblah * (pi / 180) * -1);
                  _animationController!.forward(from: 0);

                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Column(children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(Icons.arrow_back_ios_new_sharp,
                                  color: Colors.white),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Qiblah',
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
                            Container(),
                          ],
                        ),
                        SizedBox(height: 120),
                        SizedBox(
                            height: 300,
                            child: AnimatedBuilder(
                              animation: animation!,
                              builder: (context, child) => Transform.rotate(
                                  angle: animation!.value,
                                  child: Image.asset('assets/qibla.png')),
                            )),
                        SizedBox(height: 30),
                        Text(
                          "${qiblahDirection.direction.toInt()}°",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                    ),
                  );
                },
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: cyan_bg,
              automaticallyImplyLeading: true,
              leading: GestureDetector(
                onTap: () => Get.back(),
                child:
                    Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white),
              ),
            ),
            backgroundColor: cyan_bg,
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Text(
                        'Please allow location permission',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        getPermission();
                      },
                      child: Icon(Icons.refresh, size: 50, color: Colors.white),
                    )
                  ]),
            ),
          );
  }
}
