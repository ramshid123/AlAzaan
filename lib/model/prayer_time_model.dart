// To parse this JSON data, do
//
//     final azaanModel = azaanModelFromJson(jsonString);

import 'dart:convert';

class AzaanModel {
    AzaanModel({
        required this.code,
        required this.status,
        required this.data,
    });

    int code;
    String status;
    Data data;

    factory AzaanModel.fromRawJson(String str) => AzaanModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AzaanModel.fromJson(Map<String, dynamic> json) => AzaanModel(
        code: json["code"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.timings,
        required this.date,
        required this.meta,
    });

    Timings timings;
    Date date;
    Meta meta;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        timings: Timings.fromJson(json["timings"]),
        date: Date.fromJson(json["date"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "timings": timings.toJson(),
        "date": date.toJson(),
        "meta": meta.toJson(),
    };
}

class Date {
    Date({
        required this.readable,
        required this.timestamp,
        required this.hijri,
        required this.gregorian,
    });

    String readable;
    String timestamp;
    Hijri hijri;
    Gregorian gregorian;

    factory Date.fromRawJson(String str) => Date.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        readable: json["readable"],
        timestamp: json["timestamp"],
        hijri: Hijri.fromJson(json["hijri"]),
        gregorian: Gregorian.fromJson(json["gregorian"]),
    );

    Map<String, dynamic> toJson() => {
        "readable": readable,
        "timestamp": timestamp,
        "hijri": hijri.toJson(),
        "gregorian": gregorian.toJson(),
    };
}

class Gregorian {
    Gregorian({
        required this.date,
        required this.format,
        required this.day,
        required this.weekday,
        required this.month,
        required this.year,
        required this.designation,
    });

    String date;
    String format;
    String day;
    GregorianWeekday weekday;
    GregorianMonth month;
    String year;
    Designation designation;

    factory Gregorian.fromRawJson(String str) => Gregorian.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
        date: json["date"],
        format: json["format"],
        day: json["day"],
        weekday: GregorianWeekday.fromJson(json["weekday"]),
        month: GregorianMonth.fromJson(json["month"]),
        year: json["year"],
        designation: Designation.fromJson(json["designation"]),
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "format": format,
        "day": day,
        "weekday": weekday.toJson(),
        "month": month.toJson(),
        "year": year,
        "designation": designation.toJson(),
    };
}

class Designation {
    Designation({
        required this.abbreviated,
        required this.expanded,
    });

    String abbreviated;
    String expanded;

    factory Designation.fromRawJson(String str) => Designation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        abbreviated: json["abbreviated"],
        expanded: json["expanded"],
    );

    Map<String, dynamic> toJson() => {
        "abbreviated": abbreviated,
        "expanded": expanded,
    };
}

class GregorianMonth {
    GregorianMonth({
        required this.number,
        required this.en,
    });

    int number;
    String en;

    factory GregorianMonth.fromRawJson(String str) => GregorianMonth.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GregorianMonth.fromJson(Map<String, dynamic> json) => GregorianMonth(
        number: json["number"],
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "en": en,
    };
}

class GregorianWeekday {
    GregorianWeekday({
        required this.en,
    });

    String en;

    factory GregorianWeekday.fromRawJson(String str) => GregorianWeekday.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GregorianWeekday.fromJson(Map<String, dynamic> json) => GregorianWeekday(
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
    };
}

class Hijri {
    Hijri({
        required this.date,
        required this.format,
        required this.day,
        required this.weekday,
        required this.month,
        required this.year,
        required this.designation,
        required this.holidays,
    });

    String date;
    String format;
    String day;
    HijriWeekday weekday;
    HijriMonth month;
    String year;
    Designation designation;
    List<dynamic> holidays;

    factory Hijri.fromRawJson(String str) => Hijri.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Hijri.fromJson(Map<String, dynamic> json) => Hijri(
        date: json["date"],
        format: json["format"],
        day: json["day"],
        weekday: HijriWeekday.fromJson(json["weekday"]),
        month: HijriMonth.fromJson(json["month"]),
        year: json["year"],
        designation: Designation.fromJson(json["designation"]),
        holidays: List<dynamic>.from(json["holidays"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "format": format,
        "day": day,
        "weekday": weekday.toJson(),
        "month": month.toJson(),
        "year": year,
        "designation": designation.toJson(),
        "holidays": List<dynamic>.from(holidays.map((x) => x)),
    };
}

class HijriMonth {
    HijriMonth({
        required this.number,
        required this.en,
        required this.ar,
    });

    int number;
    String en;
    String ar;

    factory HijriMonth.fromRawJson(String str) => HijriMonth.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HijriMonth.fromJson(Map<String, dynamic> json) => HijriMonth(
        number: json["number"],
        en: json["en"],
        ar: json["ar"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "en": en,
        "ar": ar,
    };
}

class HijriWeekday {
    HijriWeekday({
        required this.en,
        required this.ar,
    });

    String en;
    String ar;

    factory HijriWeekday.fromRawJson(String str) => HijriWeekday.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HijriWeekday.fromJson(Map<String, dynamic> json) => HijriWeekday(
        en: json["en"],
        ar: json["ar"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
    };
}

class Meta {
    Meta({
        required this.latitude,
        required this.longitude,
        required this.timezone,
        required this.method,
        required this.latitudeAdjustmentMethod,
        required this.midnightMode,
        required this.school,
        required this.offset,
    });

    double latitude;
    double longitude;
    String timezone;
    Method method;
    String latitudeAdjustmentMethod;
    String midnightMode;
    String school;
    Map<String, int> offset;

    factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        timezone: json["timezone"],
        method: Method.fromJson(json["method"]),
        latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"],
        midnightMode: json["midnightMode"],
        school: json["school"],
        offset: Map.from(json["offset"]).map((k, v) => MapEntry<String, int>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "timezone": timezone,
        "method": method.toJson(),
        "latitudeAdjustmentMethod": latitudeAdjustmentMethod,
        "midnightMode": midnightMode,
        "school": school,
        "offset": Map.from(offset).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Method {
    Method({
        required this.id,
        required this.name,
        required this.params,
        required this.location,
    });

    int id;
    String name;
    Params params;
    Location location;

    factory Method.fromRawJson(String str) => Method.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Method.fromJson(Map<String, dynamic> json) => Method(
        id: json["id"],
        name: json["name"],
        params: Params.fromJson(json["params"]),
        location: Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "params": params.toJson(),
        "location": location.toJson(),
    };
}

class Location {
    Location({
        required this.latitude,
        required this.longitude,
    });

    double latitude;
    double longitude;

    factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

class Params {
    Params({
        required this.fajr,
        required this.isha,
    });

    int fajr;
    int isha;

    factory Params.fromRawJson(String str) => Params.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Params.fromJson(Map<String, dynamic> json) => Params(
        fajr: json["Fajr"],
        isha: json["Isha"],
    );

    Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Isha": isha,
    };
}

class Timings {
    Timings({
        required this.fajr,
        required this.sunrise,
        required this.dhuhr,
        required this.asr,
        required this.sunset,
        required this.maghrib,
        required this.isha,
        required this.imsak,
        required this.midnight,
        required this.firstthird,
        required this.lastthird,
    });

    String fajr;
    String sunrise;
    String dhuhr;
    String asr;
    String sunset;
    String maghrib;
    String isha;
    String imsak;
    String midnight;
    String firstthird;
    String lastthird;

    factory Timings.fromRawJson(String str) => Timings.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        sunset: json["Sunset"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        imsak: json["Imsak"],
        midnight: json["Midnight"],
        firstthird: json["Firstthird"],
        lastthird: json["Lastthird"],
    );

    Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Sunrise": sunrise,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Sunset": sunset,
        "Maghrib": maghrib,
        "Isha": isha,
        "Imsak": imsak,
        "Midnight": midnight,
        "Firstthird": firstthird,
        "Lastthird": lastthird,
    };
}
