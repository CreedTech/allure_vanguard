import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class ArticleEntity extends Equatable {
  final String  title;

  const ArticleEntity({
    required this.title
  });

  @override
  List<Object> get props => [title];

  @override
  bool get stringify => true;
}