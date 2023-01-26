import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/article_entity.dart';
import '../repositories/article_repository.dart';
import 'usecase.dart';

class SaveArticle extends UseCase<void, ArticleEntity> {
  final ArticleRepository articleRepository;

  SaveArticle(this.articleRepository);

  @override
  Future<Either<AppError, void>> call(ArticleEntity params) async {
    return await articleRepository.saveArticle(params);
  }
}
