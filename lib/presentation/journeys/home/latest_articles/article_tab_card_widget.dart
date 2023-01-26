import 'package:allure_vanguard/data/models/source_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/constants/palettes.dart';
import '../../../../common/constants/route_constants.dart';
import '../../../../common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/extensions/string_extensions.dart';
import '../../../../data/core/api_constants.dart';
import '../../../../data/models/article_detail_model.dart';
import '../../article_details/article_detail_arguments.dart';

class ArticleTabCardWidget extends StatelessWidget {
  final int articleId;
  final String title;
  final String? img;
  final int? author;
  // final Categories? categories;
  final DateTime date;

  const ArticleTabCardWidget({
    Key? key,
    required this.articleId,
    required this.title,
    required this.img,
    required this.author,
    // this.categories,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteList.articleDetail,
          arguments: ArticleDetailArguments(articleId),
        );
      },
      child: Container(
        // height: 134,
        width: double.infinity,
        padding: const EdgeInsets.only(
            left: 25.0, bottom: 6.0, right: 18.0, top: 25.0),
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(5.0),

                    ),
                child: Icon(Icons.error),
              ),
              imageUrl: img ?? '',
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        // width: double.infinity,
                        // height: 20,

                        child: Text(
                          'By '.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: AppPalette.greyColor,
                            height: 1,
                            // letterSpacing: 1,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      Container(
                        // alignment: Alignment.,
                        width: Sizes.dimen_150.w,
                        // height: 20,

                        child: Text(
                          author.toString() ??
                              'Not Prescribed'.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: AppPalette.accentColor,
                            fontSize: 11,
                            height: 1,
                            overflow: TextOverflow.ellipsis,

                            // letterSpacing: 1,
                          ),
                        ),
                      ),
                      // Text.rich(
                      //   TextSpan(
                      //     text: 'By '.toUpperCase(),
                      //     style: const TextStyle(
                      //       fontWeight: FontWeight.w400,
                      //       fontStyle: FontStyle.normal,
                      //       color: AppPalette.greyColor,
                      //       height: 1,
                      //       // letterSpacing: 1,
                      //       fontSize: 11,
                      //     ),
                      //     children: <InlineSpan>[
                      //       TextSpan(
                      //         text: articles[index]
                      //                 .author
                      //                 ?.toUpperCase() ??
                      //             'Not Prescribed'
                      //                 .toUpperCase(),
                      //         style: const TextStyle(
                      //           fontWeight: FontWeight.w400,
                      //           fontStyle: FontStyle.normal,
                      //           color: AppPalette.accentColor,
                      //           fontSize: 11,
                      //           height: 1,
                      //           overflow: TextOverflow.ellipsis,
                      //
                      //           // letterSpacing: 1,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5.0),
                        // width: double.infinity,
                        // height: 20,
                        decoration: BoxDecoration(
                          color: AppPalette.accentColor,
                        ),
                        child: Text(
                          // categories.toString(),
                          articleId.toString(),
                          style: TextStyle(
                              color: AppPalette.whiteColor, fontSize: 9.0),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 13,
                            color: AppPalette.greyColor,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Text(
                              timePosted(DateTime.parse(date.toString())),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: AppPalette.greyColor,
                                height: 1,
                                // letterSpacing: 1,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
            //     child: CachedNetworkImage(
            //       imageUrl: img!,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: Sizes.dimen_4.h),
            //   child: Text(
            //     title.intelliTrim(),
            //     maxLines: 1,
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 14.0,
            //         fontWeight: FontWeight.w500),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

String timePosted(DateTime date) {
  return DateFormat.yMMMMd().format(date);
}
