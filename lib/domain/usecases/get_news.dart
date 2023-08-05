import 'package:allure_vanguard/domain/entities/article_page_params.dart';
import 'package:allure_vanguard/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/article_entity.dart';
import '../entities/app_error.dart';
import '../entities/no_params.dart';
import '../repositories/article_repository.dart';

class GetNews extends UseCase<List<ArticleEntity>, ArticlePageParams> {
  //1
  final ArticleRepository repository;

  //2
  GetNews(this.repository);

  //3
  @override
  Future<Either<AppError, List<ArticleEntity>>> call(ArticlePageParams articlePageParams) async {
    //4
    return await repository.getNews(articlePageParams.page);
  }
}