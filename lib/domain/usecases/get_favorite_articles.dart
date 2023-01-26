import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/article_entity.dart';
import '../entities/no_params.dart';
import '../repositories/article_repository.dart';
import 'usecase.dart';

class GetFavoriteArticles extends UseCase<List<ArticleEntity>, NoParams> {
  final ArticleRepository articleRepository;

  GetFavoriteArticles(this.articleRepository);

  @override
  Future<Either<AppError, List<ArticleEntity>>> call(NoParams noParams) async {
    return await articleRepository.getFavoriteArticles();
  }
}
