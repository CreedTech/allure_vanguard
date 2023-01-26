import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/article_entity.dart';
import '../../../domain/entities/article_search_params.dart';
import '../../../domain/usecases/search_articles.dart';
import '../loading/loading_cubit.dart';

part 'search_article_state.dart';

class SearchArticleCubit extends Cubit<SearchArticleState> {
  final SearchArticles searchArticles;
  final LoadingCubit loadingCubit;

  SearchArticleCubit({
    required this.searchArticles,
    required this.loadingCubit,
  }) : super(SearchArticleInitial());

  Future<void> searchTermChanged(String value) async {
    loadingCubit.show();
    if (value.length > 2) {
      emit(SearchArticleLoading());
      final Either<AppError, List<ArticleEntity>> response =
          await searchArticles(ArticleSearchParams(value: value));
      emit(response.fold(
        (l) => SearchArticleError(l.appErrorType),
        (r) => SearchArticleLoaded(r),
      ));
    }
    loadingCubit.hide();
  }
}
