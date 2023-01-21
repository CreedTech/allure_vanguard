import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../domain/repositories/news_repository.dart';
import '../models/article_response.dart';

class GetSourceNewsBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =
  BehaviorSubject<ArticleResponse>();

  getSourceNews(String sourceId) async {
    ArticleResponse response = await _repository.getSourceNews(sourceId);
    _subject.sink.add(response);
  }

  void drainStream(){ _subject.value = null as ArticleResponse; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;

}
final getSourceNewsBloc = GetSourceNewsBloc();