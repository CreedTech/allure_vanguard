
import 'package:allure_vanguard/data/core/api_client.dart';
import 'package:allure_vanguard/data/models/article_model.dart';

import '../core/api_constants.dart';
import '../models/article_detail_model.dart';
import '../models/article_result_model.dart';

abstract class ArticleRemoteDataSource {
  Future<List<ArticleModel>> getTopHeadlines();
  Future<List<ArticleModel>> getSources();
  Future<List<ArticleModel>> search(String value);
  Future<List<ArticleModel>> getHotNews();
  Future<List> getNews();
  Future<List<ArticleModel>> getSourceNews(int sourceId);
  Future<ArticleDetailModel> getArticleDetail(int id);
}

class ArticleRemoteDataSourceImpl extends ArticleRemoteDataSource {
  final ApiClient _client;

  ArticleRemoteDataSourceImpl(this._client);

  @override
  Future<List<ArticleModel>> getTopHeadlines() async {
    var params = {"apiKey": ApiConstants.API_KEY, "country": "us"};
    final response = await _client.get('top-headlines', params: params);
    final articles = ArticleResultModel.fromJson(response).articles;
    print(articles);
    return articles;
  }

  @override
  Future<List<ArticleModel>> getSources() async {
    var params = {
      "apiKey": ApiConstants.API_KEY,
      "language": "en",
      "country": "us"
    };
    final response = await _client.get('top-headlines/sources', params: params);
    final articles = ArticleResultModel.fromJson(response).articles;
    print(articles);
    return articles;
  }

  @override
  Future<List<ArticleModel>> search(String value) async {
    var params = {
      "apiKey": ApiConstants.API_KEY,
      "q": value,
      "sortBy": "popularity"
    };
    final response = await _client.get('everything', params: params);
    final articles = ArticleResultModel.fromJson(response).articles;
    return articles;
  }
  @override
  Future<ArticleDetailModel> getArticleDetail(int id) async {
    final response = await _client.get('article/$id');
    final article = ArticleDetailModel.fromJson(response);
    return article;
    // if (_isValidArticleDetail(article)) {
    //   return article;
    // }
    // throw Exception();
  }

  bool _isValidArticleDetail(ArticleDetailModel article) {
    return article.title.isNotEmpty &&
        // article.title.isNotEmpty &&
        article.id != 1;
  }

  @override
  Future<List<ArticleModel>> getHotNews() async {
    var params = {
      "apiKey": ApiConstants.API_KEY,
      "q": "apple",
      "sortBy": "popularity"
    };
    final response = await _client.get('everything', params: params);
    final articles = ArticleResultModel.fromJson(response).articles;
    return articles;
  }

  @override
  Future<List<ArticleModel>> getSourceNews(int sourceId) async {
    var params = {"apiKey": ApiConstants.API_KEY, "sources": sourceId};
    final response = await _client.get('everything', params: params);
    final articles = ArticleResultModel.fromJson(response).articles;
    return articles;
  }

  @override
  Future<List> getNews() async {
    // var params = {"apiKey": ApiConstants.API_KEY, "country": "us"};
    final response = await _client.get('posts?_embed');
    final  articles = ArticleResultModel.fromJson(response).articles as dynamic;
    // List articles = json.decode(response.body);
    // return jsonResponse.map((job) => new ProductList.fromJson(job)).toList();
    print(articles);
    return articles;
  }
}
