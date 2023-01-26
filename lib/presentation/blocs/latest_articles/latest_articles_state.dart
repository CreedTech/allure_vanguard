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

  const LatestArticlesLoaded({
    required this.articles,
    this.defaultIndex = 0,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object> get props => [articles, defaultIndex];
}


class LatestArticlesLoading extends LatestArticlesState {}