import 'package:allure_vanguard/data/models/source_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/palettes.dart';
import '../../../../common/constants/route_constants.dart';
import '../../../../common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../data/models/article_detail_model.dart';
import '../../article_details/article_detail_arguments.dart';

class ArticleCardWidget extends StatelessWidget {
  final int articleId;
  final String? img;
  // final Categories? categories;
  final String title;

  const ArticleCardWidget({
    Key? key,
    required this.articleId,
    this.img,
    // this.categories,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            RouteList.articleDetail,
            arguments: ArticleDetailArguments(articleId),
          );
        },
        child: Container(
          // padding: const EdgeInsets.only(
          //     left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
          child: Stack(
            children: [
              Container(
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    // height: 80.0,
                    // width: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(5.0),

                        ),
                    child: Icon(Icons.error),
                  ),
                  imageUrl: img ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10.0,
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  width: Sizes.dimen_300.w + 50,
                  child: Column(
                    children: <Widget>[
                      Text(
                        title.toUpperCase(),
                        maxLines: 4,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.fade,
                            fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 80.0,
                left: 10.0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5.0),
                  // width: double.infinity,
                  // height: 20,
                  decoration: BoxDecoration(
                    color: AppPalette.accentColor,
                  ),
                  child: Text(
                    articleId.toString(),
                    style:
                        TextStyle(color: AppPalette.whiteColor, fontSize: 9.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ClipRRect(
// borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
// child: CachedNetworkImage(
// imageUrl: '$img',
// fit: BoxFit.cover,
// ),
// ),
