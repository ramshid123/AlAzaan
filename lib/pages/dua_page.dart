import 'package:alazaan/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DuaPage extends StatefulWidget {
  DuaPage({super.key});

  @override
  State<DuaPage> createState() => _DuaPageState();
}

class _DuaPageState extends State<DuaPage> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
        ),
        title: Text(
          'Dua',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: CupertinoPicker(
            looping: true,
        itemExtent: Get.height/4,
        backgroundColor: Colors.white,
        onSelectedItemChanged: (i){print(i);},
        selectionOverlay:PerformanceOverlay(rasterizerThreshold: 10),
        children: [
         for(int i=0;i<50;i++)
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Text('nklakjdflakdjfalkjdflakfdjalksdjfalkdsjfaldfkjoptionklakjdflakdjfalkjdflakfdjalksdjfalkdsjfaldfkj $i'),
         )
        ],
      )),
    );
  }
}
