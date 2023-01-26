part of 'search_article_cubit.dart';

abstract class SearchArticleState extends Equatable {
  const SearchArticleState();

  @override
  List<Object> get props => [];
}

class SearchArticleInitial extends SearchArticleState {}

class SearchArticleLoaded extends SearchArticleState {
  final List<ArticleEntity> articles;

  SearchArticleLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

class SearchArticleLoading extends SearchArticleState {}

class SearchArticleError extends SearchArticleState {
  final AppErrorType errorType;

  SearchArticleError(this.errorType);

  @override
  List<Object> get props => [errorType];
}
