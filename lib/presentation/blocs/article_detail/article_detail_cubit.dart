import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/article_detail_entity.dart';
import '../../../domain/entities/article_params.dart';
import '../../../domain/usecases/get_article_detail.dart';
import '../favourite/favorite_cubit.dart';
import '../loading/loading_cubit.dart';

part 'article_detail_state.dart';

class ArticleDetailCubit extends Cubit<ArticleDetailState> {
  final GetArticleDetail getArticleDetail;
  final FavoriteCubit favoriteCubit;
  final LoadingCubit loadingCubit;

  ArticleDetailCubit({
    required this.getArticleDetail,
    required this.favoriteCubit,
    required this.loadingCubit,
  }) : super(ArticleDetailInitial());

  void loadArticleDetail(int articleId) async {
    loadingCubit.show();
    final Either<AppError, ArticleDetailEntity> eitherResponse =
        await getArticleDetail(
      ArticleParams(articleId),
    );

    emit(eitherResponse.fold(
      (l) => ArticleDetailError(l.appErrorType),
      (r) => ArticleDetailLoaded(r),
    ));

    favoriteCubit.checkIfArticleFavorite(articleId);
    loadingCubit.hide();
  }
}
