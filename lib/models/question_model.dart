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
  String soal;
  String opsiA;
  String opsiB;
  String opsiC;
  String opsiD;
  String jawaban;

  Datum({
    required this.id,
    required this.soal,
    required this.opsiA,
    required this.opsiB,
    required this.opsiC,
    required this.opsiD,
    required this.jawaban,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        soal: json["soal"],
        opsiA: json["opsi_a"],
        opsiB: json["opsi_b"],
        opsiC: json["opsi_c"],
        opsiD: json["opsi_d"],
        jawaban: json["jawaban"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "soal": soal,
        "opsi_a": opsiA,
        "opsi_b": opsiB,
        "opsi_c": opsiC,
        "opsi_d": opsiD,
        "jawaban": jawaban,
      };

  String getOption(String option) {
    switch (option.toLowerCase()) {
      case 'a':
        return opsiA;
      case 'b':
        return opsiB;
      case 'c':
        return opsiC;
      case 'd':
        return opsiD;
      default:
        return '';
    }
  }
}

enum OpsiBetul { A, B, C }

final opsiBetulValues =
    EnumValues({"a": OpsiBetul.A, "b": OpsiBetul.B, "c": OpsiBetul.C});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
