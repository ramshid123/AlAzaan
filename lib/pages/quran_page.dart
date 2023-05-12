import 'package:alazaan/constants/colors.dart';
import 'package:alazaan/model/get_model.dart';
import 'package:alazaan/model/surahs_model.dart';
import 'package:alazaan/model/surath_ar_model.dart';
import 'package:alazaan/model/suarth_en_model.dart' as Surath_En;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class QuranPage extends StatelessWidget {
  QuranPage({super.key});

  final quranCont = Get.find<QuranView>(tag: 'quran');

  void initApi() async {
    // print(surah[0].toString().substring(0,39));
    quranCont.surahs_loading.value = true;

    var response =
        await http.get(Uri.parse('http://api.alquran.cloud/v1/surah'));
    quranCont.surah_list.value = Surahs.fromRawJson(response.body).data;

    await getSurah();

    quranCont.surahs_loading.value = false;
  }

  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    initApi();
    return Obx(() {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon:
                  Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
            ),
            title: Text(
              'Quran',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            centerTitle: true,
            actions: [
              Transform.scale(
                scale: 1.5,
                child: Switch(
                  value: quranCont.isEnglish.value,
                  onChanged: (i) {
                    quranCont.isEnglish.value = i;
                    getSurah();
                  },
                  activeColor: cyan_bg.withOpacity(0.3),
                  activeTrackColor: cyan_bg.withOpacity(0.5),
                  inactiveTrackColor: cyan_bg.withOpacity(0.5),
                  inactiveThumbColor: cyan_bg.withOpacity(0.3),
                  activeThumbImage: NetworkImage(
                      'https://www.pngarts.com/files/3/Letter-A-PNG-Image-Transparent.png'),
                  inactiveThumbImage: NetworkImage(
                      'https://skyeyclan.weebly.com/uploads/1/2/3/8/123813182/388848250.png'),
                ),
              ),
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: ShowSearch());
                },
                icon: Icon(Icons.search, color: Colors.black),
              ),
            ],
          ),
          body: quranCont.surahs_loading.value
              ? Center(
                  child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    color: cyan_bg,
                  ),
                ))
              : Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => SurahElement(
                            quranCont.surah_list.value[index].englishName,
                            index),
                        itemCount: quranCont.surah_list.value.length,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      width: Get.width,
                      color: cyan_bg,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            quranCont
                                .surah_list
                                .value[quranCont.selectedIndex.value]
                                .englishName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${quranCont.surah_list.value[quranCont.selectedIndex.value].numberOfAyahs} Aya, ${quranCont.surah_list.value[quranCont.selectedIndex.value].revelationType}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: quranCont.single_surath_loading.value
                          ? Center(
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child:
                                    CircularProgressIndicator(color: cyan_bg),
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Obx(() {
                                  return AyaElement(
                                      quranCont.surath_ar.value[index].text,
                                      quranCont.surath_en.value[index].text,
                                      index);
                                }),
                                separatorBuilder: (context, index) =>
                                    Divider(color: cyan_bg, height: 30),
                                itemCount: quranCont.surath_ar.value.length,
                              )),
                    )
                  ],
                ));
    });
  }
}

Future getSurah() async {
  final quranCont = Get.find<QuranView>(tag: 'quran');

  quranCont.single_surath_loading.value = true;

  var response = await http.get(Uri.parse(
      'http://api.alquran.cloud/v1/surah/${quranCont.selectedIndex.value + 1}'));
  quranCont.surath_ar.value = SurathAr.fromRawJson(response.body).data.ayahs;

  response = await http.get(Uri.parse(
      'http://api.alquran.cloud/v1/surah/${quranCont.selectedIndex.value + 1}/${quranCont.isEnglish.value ? 'en.asad' : 'ml.abdulhameed'}'));
  quranCont.surath_en.value =
      Surath_En.SurathEn.fromRawJson(response.body).data.ayahs;

  quranCont.single_surath_loading.value = false;
}

Widget SurahElement(String title, int index) {
  final quranCont = Get.find<QuranView>(tag: 'quran');
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: GestureDetector(
      onTap: () async {
        quranCont.selectedIndex.value = index;
        await getSurah();
      },
      child: Column(
        children: [
          Obx(() {
            return Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: quranCont.selectedIndex.value == index
                      ? cyan_bg
                      : Colors.black),
            );
          }),
          SizedBox(height: 5),
          Obx(() {
            return Container(
              height: 2,
              width: 50,
              color: quranCont.selectedIndex.value == index
                  ? cyan_bg
                  : Colors.white,
            );
          }),
        ],
      ),
    ),
  );
}

Widget AyaElement(String ar, String en, int index) {
  String englishNumber = (index + 1).toString();
  String ar_index = '';
  for (int i = 0; i < englishNumber.length; i++) {
    ar_index = ar_index + numberMap[englishNumber[i]];
  }

  return Column(
    children: [
      SizedBox(
          width: Get.width,
          child: RichText(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.start,
            text: TextSpan(children: [
              TextSpan(
                text: ar.substring(0, ar.length - 1),
                style: GoogleFonts.getFont('Lato',
                    fontSize: 19, color: Colors.black),
              ),
              TextSpan(text: '  '),
              WidgetSpan(
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: cyan_bg,
                  child: Text(
                    ar_index,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ]),
          )),
      SizedBox(height: 10),
      SizedBox(
        width: Get.width,
        child: Text(
          '${index + 1}. $en',
          style: GoogleFonts.getFont('Lato', fontSize: 17),
          textAlign: TextAlign.start,
        ),
      ),
    ],
  );
}

Map numberMap = {
  '0': '٠',
  '1': '١',
  '2': '٢',
  '3': '٣',
  '4': '٤',
  '5': '٥',
  '6': '٦',
  '7': '٧',
  '8': '٨',
  '9': '٩',
};

class ShowSearch extends SearchDelegate {
  final quranCont = Get.find<QuranView>(tag: 'quran');
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    Icon(Icons.clear);
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    Icon(Icons.arrow_back);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    List suggestions = quranCont.surah_list.value.where((element) {
      final result = element.englishName.toString().toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestions[index].englishName;
          quranCont.selectedIndex.value = quranCont.surah_list.value
                  .where((element) => element.englishName.toString() == query)
                  .toList()[0]
                  .number -
              1;
          getSurah();
          close(context, null);
        },
        title: Text(suggestions[index].englishName),
      ),
      itemCount: suggestions.length,
    );
  }
}
