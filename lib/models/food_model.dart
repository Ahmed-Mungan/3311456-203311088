// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);

import 'dart:convert';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

class Food {
  bool? success;
  List<Result>? result;

  Food({
    this.success,
    this.result,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        success: json["success"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  String? img;
  String? des;
  String? kalori;
  String? name;

  Result({
    this.img,
    this.des,
    this.kalori,
    this.name,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        img: json["img"],
        des: json["des"],
        kalori: json["kalori"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "des": des,
        "kalori": kalori,
        "name": name,
      };
}
