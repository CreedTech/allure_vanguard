import 'package:allure_vanguard/domain/usecases/get_hot_news.dart';
import 'package:allure_vanguard/domain/usecases/get_news.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/article_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../loading/loading_cubit.dart';

part 'latest_articles_state.dart';

class LatestArticlesCubit extends Cubit<LatestArticlesState> {
  final GetNews getNews;
  // final ArticleBackdropCubit movieBackdropCubit;
  final LoadingCubit loadingCubit;

  LatestArticlesCubit({
    required this.getNews,
    // required this.movieBackdropCubit,
    required this.loadingCubit,
  }) : super(LatestArticlesInitial());

  void loadArticle({int defaultIndex = 0}) async {
    loadingCubit.show();
    final articlesEither = await getNews(NoParams());
    emit(articlesEither.fold(
          (l) => LatestArticlesError(l.appErrorType),
          (articles) {
        return LatestArticlesLoaded(
          articles: articles,
          defaultIndex: defaultIndex,
        );
      },
    ));
    loadingCubit.hide();
  }
}
