import 'package:equatable/equatable.dart';

import '../../data/models/article_detail_model.dart';
import '../../data/models/source_model.dart';

class ArticleDetailEntity extends Equatable {
  // final SourceModel? source;
  // final String  title;
  // final String? author;
  // final String? description;
  // final String? url;
  // final String? img;
  // final String? date;
  // final String? content;
  final int id;
  final DateTime date;
  final String title;
  final String content;
  final int? author;
  // final Categories? categories;

  const ArticleDetailEntity(
      {required this.id,
      required this.date,
      required this.title,
      required this.content,
        this.author,
        // this.categories,
      });

  @override
  List<Object> get props => [id];
}
