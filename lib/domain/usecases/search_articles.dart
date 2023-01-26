import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/article_entity.dart';
import '../entities/article_search_params.dart';
import '../repositories/article_repository.dart';
import 'usecase.dart';

class SearchArticles extends UseCase<List<ArticleEntity>, ArticleSearchParams> {
  final ArticleRepository repository;

  SearchArticles(this.repository);

  @override
  Future<Either<AppError, List<ArticleEntity>>> call(
      ArticleSearchParams searchParams) async {
    return await repository.getSearchedArticles(searchParams.value);
  }
}
