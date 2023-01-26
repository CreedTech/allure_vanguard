import 'package:allure_vanguard/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/article_entity.dart';
import '../entities/app_error.dart';
import '../entities/no_params.dart';
import '../repositories/article_repository.dart';

class GetTopHeadlines extends UseCase<List<ArticleEntity>, NoParams> {
  //1
  final ArticleRepository repository;

  //2
  GetTopHeadlines(this.repository);

  //3
  @override
  Future<Either<AppError, List<ArticleEntity>>> call(NoParams noParams) async {
    //4
    return await repository.getTopHeadlines();
  }
}