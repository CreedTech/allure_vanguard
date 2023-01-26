import 'package:allure_vanguard/domain/repositories/article_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/article_params.dart';
import 'usecase.dart';

class CheckIfFavoriteArticle extends UseCase<bool, ArticleParams> {
  final ArticleRepository articleRepository;

  CheckIfFavoriteArticle(this.articleRepository);

  @override
  Future<Either<AppError, bool>> call(ArticleParams articleParams) async {
    return await articleRepository.checkIfArticleFavorite(articleParams.id);
  }
}
