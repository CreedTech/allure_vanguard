import 'package:flutter/material.dart';

import '../../../../common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/screenutil/screenutil.dart';
import '../../../../data/models/article_detail_model.dart';
import '../../../../data/models/source_model.dart';
import 'article_card_widget.dart';

class AnimatedArticleCardWidget extends StatelessWidget {
  final int index;
  final int articleId;
  final String? img;
  final List<String> categories;
  final String title;
  final PageController pageController;

  const AnimatedArticleCardWidget({
    Key? key,
    required this.index,
    required this.articleId,
    this.img,
    required this.pageController,
    // this.categories,
    required this.title, required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = (pageController.page ?? 0) - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              // margin: EdgeInsets.all(10),
              height: Curves.easeIn.transform(value) *
                  ScreenUtil.screenHeight *
                  0.35,
              width: Sizes.dimen_350.w + 50,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 0.8) *
                      ScreenUtil.screenHeight *
                      0.35,
              width: Sizes.dimen_350.w + 50,
              child: child,
            ),
          );
        }
      },
      child: ArticleCardWidget(
        articleId: articleId,
        img: img,
        // categories: categories,
        title: title,
        categories: categories.join(' | '),
      ),
    );
  }
}
