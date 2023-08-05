part of 'latest_articles_cubit.dart';

abstract class LatestArticlesState extends Equatable {
  const LatestArticlesState();

  @override
  List<Object> get props => [];
}

class LatestArticlesInitial extends LatestArticlesState {}

class LatestArticlesError extends LatestArticlesState {
  final AppErrorType errorType;

  const LatestArticlesError(this.errorType);
}

class LatestArticlesLoaded extends LatestArticlesState {
  final List articles;
  final int defaultIndex;
  final bool hasReachedMax;

  const LatestArticlesLoaded({
    required this.articles,
    this.defaultIndex = 0,
    this.hasReachedMax = false,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  LatestArticlesLoaded copyWith({List? articles, bool? hasReachedMax}) {
    return LatestArticlesLoaded(
      articles: articles ?? this.articles,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [articles, defaultIndex, hasReachedMax];
}

class LatestArticlesLoading extends LatestArticlesState {}
