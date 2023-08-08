import 'package:flutter/material.dart';
import '../../../../common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../domain/entities/article_entity.dart';
import 'article_tab_card_widget.dart';


class ArticleListViewBuilder extends StatelessWidget {
  final List articles;

  const ArticleListViewBuilder({Key? key, required this.articles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height:500,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: articles.length,
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) {
            return SizedBox(
            width: Sizes.dimen_1.w,
            );
          },
          itemBuilder: (context, index) {
            final ArticleEntity article = articles[index];
            return ArticleTabCardWidget(
              articleId: article.id,
              title: article.yoastHeadJson!.title!,
              img: article.yoastHeadJson!.ogImage![0].url!, author: article.yoastHeadJson!.author,
              // categories: article.categories,
              date: article.date, categories: article.yoastHeadJson!.schema!.graph![0].articleSection!,
            );
          },
        ),
      ),
    );
  }
}
