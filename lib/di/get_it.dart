import 'package:allure_vanguard/domain/usecases/get_hot_news.dart';
import 'package:allure_vanguard/domain/usecases/get_source_news.dart';
import 'package:allure_vanguard/domain/usecases/get_sources.dart';
import 'package:allure_vanguard/domain/usecases/get_top_headlines.dart';
import 'package:allure_vanguard/presentation/blocs/latest_articles/latest_articles_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../data/core/api_client.dart';
import '../data/data_sources/article_local_data_source.dart';
import '../data/data_sources/article_remote_data_source.dart';
import '../data/data_sources/theme_local_data_source.dart';
import '../data/repositories/app_repository_impl.dart';
import '../data/repositories/article_repository_impl.dart';
import '../domain/repositories/app_repository.dart';
import '../domain/repositories/article_repository.dart';
import '../domain/usecases/check_if_article_favorite.dart';
import '../domain/usecases/delete_favorite_article.dart';
import '../domain/usecases/get_article_detail.dart';
import '../domain/usecases/get_favorite_articles.dart';
import '../domain/usecases/get_news.dart';
import '../domain/usecases/get_preferred_theme.dart';
import '../domain/usecases/save_article.dart';
import '../domain/usecases/search_articles.dart';
import '../domain/usecases/update_theme.dart';
import '../presentation/blocs/article_carousel/article_carousel_cubit.dart';
import '../presentation/blocs/article_detail/article_detail_cubit.dart';
import '../presentation/blocs/favourite/favorite_cubit.dart';
import '../presentation/blocs/loading/loading_cubit.dart';
import '../presentation/blocs/theme/theme_cubit.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<ArticleRemoteDataSource>(
          () => ArticleRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<ArticleLocalDataSource>(
          () => ArticleLocalDataSourceImpl());
  getItInstance.registerLazySingleton<ThemeLocalDataSource>(
          () => ThemeLocalDataSourceImpl());
  getItInstance.registerLazySingleton<GetTopHeadlines>(() => GetTopHeadlines(getItInstance()));
  getItInstance.registerLazySingleton<GetHotNews>(() => GetHotNews(getItInstance()));
  getItInstance.registerLazySingleton<GetNews>(() => GetNews(getItInstance()));
  getItInstance.registerLazySingleton<GetSourceNews>(() => GetSourceNews(getItInstance()));
  getItInstance.registerLazySingleton<GetSources>(() => GetSources(getItInstance()));
  getItInstance.registerLazySingleton<SearchArticles>(() => SearchArticles(getItInstance()));
  getItInstance.registerLazySingleton<GetArticleDetail>(
          () => GetArticleDetail(getItInstance()));
  getItInstance
      .registerLazySingleton<SaveArticle>(() => SaveArticle(getItInstance()));

  getItInstance.registerLazySingleton<GetFavoriteArticles>(
          () => GetFavoriteArticles(getItInstance()));

  getItInstance.registerLazySingleton<DeleteFavoriteArticle>(
          () => DeleteFavoriteArticle(getItInstance()));

  getItInstance.registerLazySingleton<CheckIfFavoriteArticle>(
          () => CheckIfFavoriteArticle(getItInstance()));

  getItInstance
      .registerLazySingleton<ArticleRepository>(() => ArticleRepositoryImpl(
    getItInstance(),
    getItInstance(),
  ));
  getItInstance
      .registerLazySingleton<UpdateTheme>(() => UpdateTheme(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredTheme>(
          () => GetPreferredTheme(getItInstance()));
  getItInstance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
    getItInstance(),
  ));
  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());
  getItInstance.registerSingleton<ThemeCubit>(ThemeCubit(
    getPreferredTheme: getItInstance(),
    updateTheme: getItInstance(),
  ));
  getItInstance.registerFactory(
        () => ArticleCarouselCubit(
      loadingCubit: getItInstance(),
      getNews: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
        () => ArticleDetailCubit(
      loadingCubit: getItInstance(),
      getArticleDetail: getItInstance(),
      favoriteCubit: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
        () => LatestArticlesCubit(
      loadingCubit: getItInstance(),
      getNews: getItInstance(),
    ),
  );
  getItInstance.registerFactory(() => FavoriteCubit(
    saveArticle: getItInstance(),
    checkIfFavoriteArticle: getItInstance(),
    deleteFavoriteArticle: getItInstance(),
    getFavoriteArticles: getItInstance(),
  ));
}