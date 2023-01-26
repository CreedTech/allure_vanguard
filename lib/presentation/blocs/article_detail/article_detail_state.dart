part of 'article_detail_cubit.dart';

abstract class ArticleDetailState extends Equatable {
  const ArticleDetailState();

  @override
  List<Object> get props => [];
}

class ArticleDetailInitial extends ArticleDetailState {}

class ArticleDetailLoading extends ArticleDetailState {}

class ArticleDetailError extends ArticleDetailState {
  final AppErrorType errorType;

  const ArticleDetailError(this.errorType);
}

class ArticleDetailLoaded extends ArticleDetailState {
  final ArticleDetailEntity articleDetailEntity;

  const ArticleDetailLoaded(this.articleDetailEntity);

  @override
  List<Object> get props => [articleDetailEntity];
}
