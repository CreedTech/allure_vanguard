
import 'package:allure_vanguard/data/models/article_model.dart';

class ArticleResultModel {
  final List<ArticleModel> articles;

  ArticleResultModel({required this.articles});

  factory ArticleResultModel.fromJson(Map<String, dynamic> json) {
    var articles = List<ArticleModel>.empty(growable: true);
    if (json['results'] != null) {
      json['results'].forEach((v) {
        final articleModel = ArticleModel.fromJson(v);
        if (_isValidMovie(articleModel)) {
          articles.add(articleModel);
        }
      });
    }
    return ArticleResultModel(articles: articles);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.articles.map((v) => v.toJson()).toList();
    return data;
  }
}
bool _isValidMovie(ArticleModel articleModel) {
  return articleModel.source!.name!.isNotEmpty &&
      articleModel.title.isNotEmpty;
}