import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/article_params.dart';
import '../repositories/article_repository.dart';
import 'usecase.dart';

class DeleteFavoriteArticle extends UseCase<void, ArticleParams> {
  final ArticleRepository articleRepository;

  DeleteFavoriteArticle(this.articleRepository);

  @override
  Future<Either<AppError, void>> call(ArticleParams articleParams) async {
    return await articleRepository.deleteFavoriteArticle(articleParams.id);
  }
}
