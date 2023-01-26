import 'package:allure_vanguard/data/models/source_model.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/article_entity.dart';


part 'article_table.g.dart';

@HiveType(typeId: 0)
class ArticleTable extends ArticleEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final DateTime date;

  ArticleTable({
    required this.id,
    required this.title,
    required this.date,
  }) : super(
    id: id,
    title: title,
    date: date,
    content: '',
  );

  factory ArticleTable.fromArticleEntity(ArticleEntity articleEntity) {
    return ArticleTable(
      id: articleEntity.id,
      title: articleEntity.title,
      date: articleEntity.date,
    );
  }
}
