// To parse this JSON data, do
//
//     final quotesModel = quotesModelFromJson(jsonString);

import 'dart:convert';

List<QuotesModel> quotesModelFromJson(String str) => List<QuotesModel>.from(json.decode(str).map((x) => QuotesModel.fromJson(x)));

String quotesModelToJson(List<QuotesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuotesModel {
    String q;
    String a;
    String c;

    QuotesModel({
        required this.q,
        required this.a,
        required this.c,
    });

    factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
        q: json["q"],
        a: json["a"],
        c: json["c"],
    );

    Map<String, dynamic> toJson() => {
        "q": q,
        "a": a,
        "c": c,
    };
}
