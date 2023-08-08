import 'package:equatable/equatable.dart';

import '../../data/models/yoast_head_json.dart';
import 'article_detail_entity.dart';

class ArticleEntity extends Equatable {
  final int id;
  final DateTime date;
  final YoastHeadJson? yoastHeadJson;
  // final Categories? categories;

  const ArticleEntity(
      {required this.id,
        required this.date,
        required this.yoastHeadJson,
        // this.categories
      // required this.title, this.source,  this.date, this.author, this.description, this.url, this.img, this.content,
      });

  @override
  List<Object> get props => [id,date];

  @override
  bool get stringify => true;

  factory ArticleEntity.fromArticleDetailEntity(
      ArticleDetailEntity articleDetailEntity) {
    return ArticleEntity(
      id: articleDetailEntity.id,
      date: articleDetailEntity.date,
      yoastHeadJson: articleDetailEntity.yoastHeadJson,
      // categories: articleDetailEntity.categories

    );
  }
}

// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);
