import 'package:allure_vanguard/data/models/source_model.dart';
import 'package:allure_vanguard/domain/entities/yoast_entity.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/article_entity.dart';
import '../models/yoast_head_json.dart';


part 'yoast_table.g.dart';

@HiveType(typeId: 1)
class YoastTable extends YoastEntity {

  @HiveField(0)
  final String ogTitle;

  @HiveField(1)
  final String ogDescription;

  @HiveField(2)
  final String author;

  YoastTable({
    required this.ogTitle, required this.ogDescription, required this.author,
  }) : super(
    ogTitle: ogTitle,
    ogDescription: ogDescription,
    author: author,
  );

  factory YoastTable.fromArticleEntity(YoastEntity yoastEntity) {
    return YoastTable(
      ogTitle: yoastEntity.ogTitle,
      ogDescription: yoastEntity.ogDescription,
      author: yoastEntity.author
    );
  }
}
