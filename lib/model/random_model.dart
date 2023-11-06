import 'dart:convert';

List<RandomQuotesModel> randomQuotesModelFromJson(String str) =>
    List<RandomQuotesModel>.from(
        json.decode(str).map((x) => RandomQuotesModel.fromJson(x)));

String randomQuotesModelToJson(List<RandomQuotesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RandomQuotesModel {
  String q;
  String a;

  RandomQuotesModel({
    required this.q,
    required this.a,
  });

  factory RandomQuotesModel.fromJson(Map<String, dynamic> json) =>
      RandomQuotesModel(
        q: json["q"],
        a: json["a"],
      );

  Map<String, dynamic> toJson() => {
        "q": q,
        "a": a,
      };
}
