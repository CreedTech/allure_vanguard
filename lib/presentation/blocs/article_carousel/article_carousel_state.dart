part of 'article_carousel_cubit.dart';

abstract class ArticleCarouselState extends Equatable {
  const ArticleCarouselState();

  @override
  List<Object> get props => [];
}

class ArticleCarouselInitial extends ArticleCarouselState {}

class ArticleCarouselError extends ArticleCarouselState {
  final AppErrorType errorType;

  const ArticleCarouselError(this.errorType);
}

class ArticleCarouselLoaded extends ArticleCarouselState {
  final List articles;
  final int defaultIndex;

  const ArticleCarouselLoaded({
    required this.articles,
    this.defaultIndex = 0,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object> get props => [articles, defaultIndex];
}
