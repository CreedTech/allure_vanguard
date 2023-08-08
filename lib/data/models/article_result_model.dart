
import 'package:allure_vanguard/data/models/article_model.dart';

class ArticleResultModel {
  final List<ArticleModel> articles;

  ArticleResultModel({required this.articles});

  ArticleResultModel.fromJson(Map<dynamic, dynamic> json)
      : articles =
  (json["articles"] as List).map((i) => new ArticleModel.fromJson(i)).toList();

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['articles'] = this.articles.map((v) => v.toJson()).toList();
    return data;
  }
}
// bool _isValidMovie(ArticleModel articleModel) {
//   return articleModel.id != 1 &&
//       articleModel.yoastHeadJson.title!.isNotEmpty;
// }