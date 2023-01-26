import 'package:allure_vanguard/domain/usecases/get_news.dart';
import 'package:allure_vanguard/domain/usecases/get_top_headlines.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/article_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../loading/loading_cubit.dart';

part 'article_carousel_state.dart';

class ArticleCarouselCubit extends Cubit<ArticleCarouselState> {
  final GetNews getNews;
  // final ArticleBackdropCubit movieBackdropCubit;
  final LoadingCubit loadingCubit;

  ArticleCarouselCubit({
    required this.getNews,
    // required this.movieBackdropCubit,
    required this.loadingCubit,
  }) : super(ArticleCarouselInitial());

  void loadCarousel({int defaultIndex = 0}) async {
    loadingCubit.show();
    final articlesEither = await getNews(NoParams());
    emit(articlesEither.fold(
      (l) => ArticleCarouselError(l.appErrorType),
      (articles) {
        // movieBackdropCubit.backdropChanged(articles[defaultIndex]);
        return ArticleCarouselLoaded(
          articles: articles,
          defaultIndex: defaultIndex,
        );
      },
    ));
    loadingCubit.hide();
  }
}
