// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  List<Datum> data;

  QuestionModel({
    required this.data,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  Soal soal;
  OpsiA opsiA;
  OpsiB opsiB;
  OpsiC opsiC;
  OpsiD opsiD;
  Jabawan jabawan;
  OpsiBetul opsiBetul;

  Datum({
    required this.id,
    required this.soal,
    required this.opsiA,
    required this.opsiB,
    required this.opsiC,
    required this.opsiD,
    required this.jabawan,
    required this.opsiBetul,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        soal: soalValues.map[json["soal"]]!,
        opsiA: opsiAValues.map[json["opsi_a"]]!,
        opsiB: opsiBValues.map[json["opsi_b"]]!,
        opsiC: opsiCValues.map[json["opsi_c"]]!,
        opsiD: opsiDValues.map[json["opsi_d"]]!,
        jabawan: jabawanValues.map[json["jabawan"]]!,
        opsiBetul: opsiBetulValues.map[json["opsi_betul"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "soal": soalValues.reverse[soal],
        "opsi_a": opsiAValues.reverse[opsiA],
        "opsi_b": opsiBValues.reverse[opsiB],
        "opsi_c": opsiCValues.reverse[opsiC],
        "opsi_d": opsiDValues.reverse[opsiD],
        "jabawan": jabawanValues.reverse[jabawan],
        "opsi_betul": opsiBetulValues.reverse[opsiBetul],
      };
}

enum Jabawan { BAHASA_HTML_NTUK_WEBSITE }

final jabawanValues =
    EnumValues({"Bahasa HTML Ntuk Website": Jabawan.BAHASA_HTML_NTUK_WEBSITE});

enum OpsiA { UNTUK_ANDROID }

final opsiAValues = EnumValues({"Untuk Android": OpsiA.UNTUK_ANDROID});

enum OpsiB { UNTUK_IOS }

final opsiBValues = EnumValues({"Untuk Ios": OpsiB.UNTUK_IOS});

enum OpsiBetul { C }

final opsiBetulValues = EnumValues({"c": OpsiBetul.C});

enum OpsiC { UNTUK_WEBSITE }

final opsiCValues = EnumValues({"Untuk Website": OpsiC.UNTUK_WEBSITE});

enum OpsiD { UNTUK_LINUX }

final opsiDValues = EnumValues({"Untuk Linux": OpsiD.UNTUK_LINUX});

enum Soal { TUJUAN_BAHASA_HTML }

final soalValues = EnumValues({"Tujuan Bahasa HTML": Soal.TUJUAN_BAHASA_HTML});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
