import 'package:allure_vanguard/data/models/yoast_head_json.dart';
import 'dart:convert';
import '../../domain/entities/article_entity.dart';





List<ArticleModel> modelUserFromJson(String str) => List<ArticleModel>.from(json.decode(str).map((x) => ArticleModel.fromJson(x)));
String modelUserToJson(List<ArticleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleModel extends ArticleEntity {
  // final SourceModel? source;
  // final String? author;
  // final String title;
  // final String? description;
  // final String? url;
  // final String? img;
  // final String? date;
  // final String? content;

  final int id;
  final DateTime date;
  final YoastHeadJson yoastHeadJson;
  // final Categories? categories;

  ArticleModel({
    required this.id,
    required this.date,
    required this.yoastHeadJson,
    // this.categories,
    // this.author,
    // this.description,
    // required this.title,
    // this.url,
    // this.img,
    // this.date,
    // this.content,
  }) : super(
            id: id,
            yoastHeadJson: yoastHeadJson,
            date: date,
            // categories: categories,
  );

  factory ArticleModel.fromJson(Map<dynamic, dynamic> json) => ArticleModel(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
      );

  Map<dynamic, dynamic> toJson() => {
    "id":id,
    "date":date.toIso8601String(),
    "yoast_head_json": yoastHeadJson.toJson(),
  };
}

