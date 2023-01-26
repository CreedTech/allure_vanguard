import 'package:allure_vanguard/domain/repositories/article_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/article_entity.dart';
import '../entities/article_params.dart';
import 'usecase.dart';

class GetSourceNews extends UseCase<List<ArticleEntity>, ArticleParams> {
  final ArticleRepository repository;

  GetSourceNews(this.repository);

  @override
  Future<Either<AppError, List<ArticleEntity>>> call(
      ArticleParams articleParams) async {
    return await repository.getSourceNews(articleParams.id);
  }
}
