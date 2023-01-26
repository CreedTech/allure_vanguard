import 'package:equatable/equatable.dart';

import '../../data/models/article_detail_model.dart';
import '../../data/models/source_model.dart';
import 'article_detail_entity.dart';
import 'dart:convert';

class ArticleEntity extends Equatable {
  final int id;
  final DateTime date;
  final String title;
  final String content;
  final int? author;
  // final Categories? categories;

  const ArticleEntity(
      {required this.id,
      required this.date,
      required this.title,
      required this.content,
        this.author,
        // this.categories
      // required this.title, this.source,  this.date, this.author, this.description, this.url, this.img, this.content,
      });

  @override
  List<Object> get props => [id,title];

  @override
  bool get stringify => true;

  factory ArticleEntity.fromArticleDetailEntity(
      ArticleDetailEntity articleDetailEntity) {
    return ArticleEntity(
      // source: articleDetailEntity.source,
      // title: articleDetailEntity.title,
      // author: articleDetailEntity.author ?? '',
      // description: articleDetailEntity.description,
      // url: articleDetailEntity.url,
      // img: articleDetailEntity.img,
      // date: articleDetailEntity.date,
      // content: articleDetailEntity.content,
      id: articleDetailEntity.id,
      date: articleDetailEntity.date, title: articleDetailEntity.title,
      content: articleDetailEntity.content,
      author: articleDetailEntity.author,
      // categories: articleDetailEntity.categories

    );
  }
}

// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);
