import 'dart:io';

import 'package:allure_vanguard/data/models/article_detail_model.dart';
import 'package:allure_vanguard/data/models/article_model.dart';
import 'package:allure_vanguard/domain/entities/article_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/repositories/article_repository.dart';
import '../data_sources/article_local_data_source.dart';
import '../data_sources/article_remote_data_source.dart';
import '../tables/article_table.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  //1
  final ArticleRemoteDataSource remoteDataSource;
  final ArticleLocalDataSource localDataSource;

  //2
  ArticleRepositoryImpl(this.remoteDataSource, this.localDataSource);

  //3
  @override
  Future<Either<AppError, List<ArticleModel>>> getTopHeadlines() async {
    //4
    try {
      //5
      final articles = await remoteDataSource.getTopHeadlines();
      return Right(articles);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
  
  @override
  Future<Either<AppError, List<ArticleModel>>> getSources() async {
    //4
    try {
      //5
      final articles = await remoteDataSource.getSources();
      return Right(articles);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<ArticleEntity>>> getHotNews() async {
    try {
      //5
      final articles = await remoteDataSource.getHotNews();
      return Right(articles);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List>> getNews() async {
    try {
      //5
      final articles = await remoteDataSource.getNews();
      return Right(articles);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<ArticleEntity>>> getSourceNews(int sourceId) async {
    try {
      //5
      final articles = await remoteDataSource.getSourceNews(sourceId);
      return Right(articles);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<ArticleEntity>>> getSearchedArticles(String value) async {
    try {
      //5
      final articles = await remoteDataSource.search(value);
      return Right(articles);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> saveArticle(ArticleEntity ArticleEntity) async {
    try {
      final table = ArticleTable.fromArticleEntity(ArticleEntity);
      print(table);
      final response = await localDataSource
          .saveArticle(ArticleTable.fromArticleEntity(ArticleEntity));
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, bool>> checkIfArticleFavorite(int articleId) async {
    try {
      final response = await localDataSource.checkIfArticleFavorite(articleId);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> deleteFavoriteArticle(int articleId) async {
    try {
      final response = await localDataSource.deleteArticle(articleId);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<ArticleEntity>>> getFavoriteArticles() async {
    try {
      final response = await localDataSource.getArticles();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, ArticleDetailModel>> getArticleDetail(int id) async {
    try {
      final article = await remoteDataSource.getArticleDetail(id);
      return Right(article);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

}