import 'package:allure_vanguard/domain/entities/article_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/article_detail_entity.dart';

abstract class ArticleRepository {
  Future<Either<AppError, List<ArticleEntity>>> getTopHeadlines();
  Future<Either<AppError, List<ArticleEntity>>> getSources();
  Future<Either<AppError, List<ArticleEntity>>> getSearchedArticles(String value);
  Future<Either<AppError, List<ArticleEntity>>> getHotNews();
  Future<Either<AppError, List>> getNews();
  Future<Either<AppError, List<ArticleEntity>>> getSourceNews(int sourceId);
  Future<Either<AppError, ArticleDetailEntity>> getArticleDetail(int id);
  Future<Either<AppError, void>> saveArticle(ArticleEntity articleEntity);
  Future<Either<AppError, List<ArticleEntity>>> getFavoriteArticles();
  Future<Either<AppError, void>> deleteFavoriteArticle(int articleId);
  Future<Either<AppError, bool>> checkIfArticleFavorite(int articleId);
}