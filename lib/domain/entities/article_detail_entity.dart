import 'package:equatable/equatable.dart';

import '../../data/models/article_detail_model.dart';
import '../../data/models/source_model.dart';
import '../../data/models/yoast_head_json.dart';

class ArticleDetailEntity extends Equatable {
  final int id;
  final DateTime date;
  final YoastHeadJson yoastHeadJson;

  const ArticleDetailEntity(
      {required this.id,
        required this.date,
        required this.yoastHeadJson,
      });

  @override
  List<Object> get props => [id];
}
