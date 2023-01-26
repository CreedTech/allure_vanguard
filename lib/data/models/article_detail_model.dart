import 'package:allure_vanguard/data/models/source_model.dart';

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
  final DateTime? dateGmt;

  // final Guid? guid;
  final DateTime? modified;
  final DateTime? modifiedGmt;
  final String? slug;
  final String? link;
  final String title;
  final String content;
  final int? author;
  final int? featuredMedia;
  // final Categories? categories;

  ArticleDetailModel({
    required this.id,
    required this.date,
    this.dateGmt,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.link,
    required this.title,
    required this.content,
    this.author,
    this.featuredMedia,
    // this.categories,
  }) : super(
    id: id,
    date: date,
    content: content,
    title: title,
  );

  factory ArticleDetailModel.fromJson(Map<String, dynamic> json) {
    return ArticleDetailModel(
      id: json["id"],
      date: json["date"],
      dateGmt: json["date_gmt"] == null ? null : DateTime.parse(
          json["date_gmt"]),
      modified: json["modified"] == null ? null : DateTime.parse(
          json["modified"]),
      modifiedGmt: json["modified_gmt"] == null ? null : DateTime.parse(
          json["modified_gmt"]),
      slug: json["slug"],
      link: json["link"],
      title: json["title"],
      content: json["content"],
      author: json["author"],
      featuredMedia: json["featured_media"],
      // categories: Categories.fromJson(json["categories"]),
    );
  }

  Map<String, dynamic> toJson()
      {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data["id"]= id;
        data["date"]= date.toIso8601String();
        data["date_gmt"]= dateGmt?.toIso8601String();
        data["modified"]= modified?.toIso8601String();
        data["modified_gmt"]= modifiedGmt?.toIso8601String();
        data["slug"]= slug;
        data["link"]= link;
        data["title"]= title;
        data["content"]= content;
        data["author"]= author;
        data["featured_media"]= featuredMedia;
        // data["categories"]= this.categories;
        // if (this.categories != null) {
        //   data['categories'] =
        //       this.categories?.map((v) => v.toJson()).toList();
        // }
        return data;
      }
}
// _categories(Map<String, dynamic> json) {
//   if (json['genres'] != null) {
//     final genres = List<Categories>.empty(growable: true);
//     json['genres'].forEach((v) {
//       genres.add(new Categories.fromJson(v));
//     });
//   }
// }
//
//
//
// class Categories {
//   late int? id;
//
//   Categories({this.id});
//
//   Categories.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     return data;
//   }
// }
