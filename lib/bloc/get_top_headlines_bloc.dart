import 'package:rxdart/rxdart.dart';

import '../domain/repositories/news_repository.dart';
import '../models/article_response.dart';

class GetTopHeadlinesBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =
  BehaviorSubject<ArticleResponse>();

  getHeadlines() async {
    ArticleResponse response = await _repository.getTopHeadlines();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;

}
final getTopHeadlinesBloc = GetTopHeadlinesBloc();