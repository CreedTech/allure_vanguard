import 'package:flutter/material.dart';

import '../../../../common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../domain/entities/article_entity.dart';
import 'animated_article_card_widget.dart';

class ArticlePageView extends StatefulWidget {
  final List<ArticleEntity> articles;
  final int initialPage;

  const ArticlePageView({
    Key? key,
    required this.articles,
    this.initialPage = 0,
  })  : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);

  @override
  _ArticlePageViewState createState() => _ArticlePageViewState();
}

class _ArticlePageViewState extends State<ArticlePageView> {
  late PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 1,
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_8.h),
      height: 250.0,
      // width: 650,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final article = widget.articles[index];
          return AnimatedArticleCardWidget(
            index: index,
            pageController: _pageController!,
              articleId: article.id,
            img: article.yoastHeadJson!.ogImage![0].url!, title: article.yoastHeadJson!.title!,
            categories: article.yoastHeadJson!.schema!.graph![0].articleSection!,
            // categories: article.categories,
          );
        },
        pageSnapping: true,
        itemCount: widget.articles.length,
        onPageChanged: (index) {
          // BlocProvider.of<ArticleBackdropCubit>(context)
          //     .backdropChanged(widget.articles[index]);
        },
      ),
    );
  }
}
