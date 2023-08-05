import 'package:allure_vanguard/data/models/source_model.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/article_entity.dart';
import '../models/yoast_head_json.dart';


part 'article_table.g.dart';

@HiveType(typeId: 0)
class ArticleTable extends ArticleEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final DateTime date;


  @HiveField(2)
  final YoastHeadJson? yoastHeadJson;

  ArticleTable({
    required this.id,
    required this.yoastHeadJson,
    required this.date,
  }) : super(
    id: id,
    date: date,
    yoastHeadJson: yoastHeadJson,
  );

  factory ArticleTable.fromArticleEntity(ArticleEntity articleEntity) {
    return ArticleTable(
      id: articleEntity.id,
      date: articleEntity.date,
      yoastHeadJson: articleEntity.yoastHeadJson,
    );
  }
}
