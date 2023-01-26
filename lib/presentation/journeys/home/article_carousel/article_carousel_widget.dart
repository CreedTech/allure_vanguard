import 'package:flutter/material.dart';

import '../../../../domain/entities/article_entity.dart';
import 'article_page_view.dart';

class ArticleCarouselWidget extends StatelessWidget {
  final List articles;
  final int defaultIndex;

  const ArticleCarouselWidget({
    Key? key,
    required this.articles,
    this.defaultIndex = 0,
  })  : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          // ArticleAppBar(),
          child:ArticlePageView(
            articles: articles,
            initialPage: defaultIndex,
          ),
          // ArticleDataWidget(),


      // );
    );
  }
}
