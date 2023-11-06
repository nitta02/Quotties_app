// ignore_for_file: file_names

import 'dart:convert';

List<QuotesDayModel> quotesDayModelFromJson(String str) =>
    List<QuotesDayModel>.from(
        json.decode(str).map((x) => QuotesDayModel.fromJson(x)));

String quotesDayModelToJson(List<QuotesDayModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuotesDayModel {
  String q;
  String a;

  QuotesDayModel({
    required this.q,
    required this.a,
  });

  factory QuotesDayModel.fromJson(Map<String, dynamic> json) => QuotesDayModel(
        q: json["q"],
        a: json["a"],
      );

  Map<String, dynamic> toJson() => {
        "q": q,
        "a": a,
      };
}
