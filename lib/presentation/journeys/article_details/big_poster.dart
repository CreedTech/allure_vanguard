import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/size_constants.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/screenutil/screenutil.dart';
import '../../../domain/entities/article_detail_entity.dart';
import '../../themes/theme_text.dart';
import 'article_detail_app_bar.dart';

class BigPoster extends StatelessWidget {
  final ArticleDetailEntity article;

  const BigPoster({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: article.yoastHeadJson.ogImage![0].url!,
            width: ScreenUtil.screenWidth,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              article.yoastHeadJson.title!,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text(
              article.yoastHeadJson.schema!.graph![0].articleSection.toString(),
              style: Theme.of(context).textTheme.greySubtitle1,
            ),
            trailing: Text(
              article.yoastHeadJson.author,
              style: Theme.of(context).textTheme.violetHeadline6,
            ),
          ),
        ),
        Positioned(
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
          top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
          child: ArticleDetailAppBar(articleDetailEntity: article),
        ),
      ],
    );
  }
}
