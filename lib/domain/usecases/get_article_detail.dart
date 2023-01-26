import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/article_detail_entity.dart';
import '../entities/article_params.dart';
import '../repositories/article_repository.dart';
import 'usecase.dart';

class GetArticleDetail extends UseCase<ArticleDetailEntity, ArticleParams> {
  final ArticleRepository repository;

  GetArticleDetail(this.repository);

  @override
  Future<Either<AppError, ArticleDetailEntity>> call(
      ArticleParams articleParams) async {
    return await repository.getArticleDetail(articleParams.id);
  }
}
