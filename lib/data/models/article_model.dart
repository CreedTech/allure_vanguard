
import '../../domain/entities/ArticleEntity.dart';
import '../../models/source.dart';

class ArticleModel extends ArticleEntity {
  final SourceModel? source;
  final String? author;
  final String title;
  final String? description;
  final String? url;
  final String? img;
  final String? date;
  final String? content;

  ArticleModel({
    this.source,
    this.author,
    this.description,
    required this.title,
    this.url,
    this.img,
    this.date,
    this.content,
  }) : super(
    title: title,
  );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: json['source']?.toDouble() ?? '',
      author: json['author'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      img: json['urlToImage'] ?? '',
      date: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['author'] = this.author;
    data['author'] = this.author;
    data['description'] = this.description;
    data['title'] = this.title;
    data['url'] = this.url;
    data['img'] = this.img;
    data['publishedAt'] = this.date;
    return data;
  }
}
