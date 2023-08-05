import 'package:allure_vanguard/data/models/source_model.dart';
import 'package:allure_vanguard/data/models/yoast_head_json.dart';

import '../../domain/entities/article_detail_entity.dart';

class ArticleDetailModel extends ArticleDetailEntity {
  // final SourceModel? source;
  // final String  title;
  // final String? author;
  // final String? description;
  // final String? url;
  // final String? img;
  // final String? date;
  // final String? content;

  final int id;
  final DateTime date;
  final YoastHeadJson yoastHeadJson;


  ArticleDetailModel({
    required this.id,
    required this.date,
    required this.yoastHeadJson,
    // this.categories,
  }) : super(
    id: id,
    date: date,
    yoastHeadJson: yoastHeadJson,
  );

  factory ArticleDetailModel.fromJson(Map<dynamic, dynamic> json) {
    return ArticleDetailModel(
      id: json["id"],
      date: DateTime.parse(json["date"]),
      yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
    );
  }

  Map<dynamic, dynamic> toJson() =>
      {
        "id":id,
      "date":date.toIso8601String(),
      "yoast_head_json": yoastHeadJson.toJson(),
      };
}

