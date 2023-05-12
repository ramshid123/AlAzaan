import 'dart:convert';

class Surahs {
    Surahs({
        required this.code,
        required this.status,
        required this.data,
    });

    int code;
    String status;
    List<Datum> data;

    factory Surahs.fromRawJson(String str) => Surahs.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Surahs.fromJson(Map<String, dynamic> json) => Surahs(
        code: json["code"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.number,
        required this.name,
        required this.englishName,
        required this.englishNameTranslation,
        required this.numberOfAyahs,
        required this.revelationType,
    });

    int number;
    String name;
    String englishName;
    String englishNameTranslation;
    int numberOfAyahs;
    String revelationType;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        numberOfAyahs: json["numberOfAyahs"],
        revelationType: json["revelationType"]!,
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "numberOfAyahs": numberOfAyahs,
        "revelationType": revelationTypeValues.reverse[revelationType],
    };
}

enum RevelationType { MECCAN, MEDINAN }

final revelationTypeValues = EnumValues({
    "Meccan": RevelationType.MECCAN,
    "Medinan": RevelationType.MEDINAN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
