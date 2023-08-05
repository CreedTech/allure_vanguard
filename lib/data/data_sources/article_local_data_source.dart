import 'package:hive/hive.dart';

import '../tables/article_table.dart';


abstract class ArticleLocalDataSource {
  Future<void> saveArticle(ArticleTable articleTable);
  Future<List<ArticleTable>> getArticles();
  Future<void> deleteArticle(int articleId);
  Future<bool> checkIfArticleFavorite(int articleId);
}

class ArticleLocalDataSourceImpl extends ArticleLocalDataSource {
  @override
  Future<bool> checkIfArticleFavorite(int articleId) async {
    final articleBox = await Hive.openBox('articleBox');
    return articleBox.containsKey(articleId);
  }

  @override
  Future<void> deleteArticle(int articleId) async {
    final articleBox = await Hive.openBox('articleBox');
    await articleBox.delete(articleId);
  }

  @override
  Future<List<ArticleTable>> getArticles() async {
    final articleBox = await Hive.openBox('articleBox');
    final articleIds = articleBox.keys;
    List<ArticleTable> articles = [];
    articleIds.forEach((articleId) {
      final article = articleBox.get(articleId);
      if (article != null) {
        articles.add(articleBox.get(articleId));
      }
    });
    return articles;
  }

  @override
  Future<void> saveArticle(ArticleTable articleTable) async {
    final articleBox = await Hive.openBox('articleBox');
    await articleBox.put(articleTable.id, articleTable);
  }
}
