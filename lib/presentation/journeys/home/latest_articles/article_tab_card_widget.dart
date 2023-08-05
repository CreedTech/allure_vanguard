import 'package:allure_vanguard/data/models/source_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/constants/palettes.dart';
import '../../../../common/constants/route_constants.dart';
import '../../../../common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/extensions/string_extensions.dart';
import '../../../../data/core/api_constants.dart';
import '../../../../data/models/article_detail_model.dart';
import '../../../blocs/theme/theme_cubit.dart';
import '../../article_details/article_detail_arguments.dart';

class ArticleTabCardWidget extends StatelessWidget {
  final int articleId;
  final String title;
  final String? img;
  final String? author;
  final List<String> categories;
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
    required this.categories,
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
            left: 5.0, bottom: 6.0, right: 5.0, top: 25.0),
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
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
                  imageUrl: img!,
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
                            color:
                                context.read<ThemeCubit>().state == Themes.dark
                                    ? AppPalette.whiteColor
                                    : AppPalette.blackColor,
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
                            padding: EdgeInsets.all(5.0),
                            // width: double.infinity,
                            // height: 20,
                            decoration: BoxDecoration(
                              color: AppPalette.accentColor,
                            ),
                            child: Text(
                              // categories.toString(),
                              categories.join(' | '),
                              style: TextStyle(
                                  color: AppPalette.whiteColor, fontSize: 9.0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                    color: context.read<ThemeCubit>().state ==
                                            Themes.dark
                                        ? AppPalette.whiteColor
                                        : AppPalette.greyColor,
                                    height: 1,
                                    // letterSpacing: 1,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                              Container(
                                // alignment: Alignment.,
                                // width: Sizes.dimen_150.w,
                                // height: 20,

                                child: Text(
                                  author!.toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: context.read<ThemeCubit>().state ==
                                            Themes.dark
                                        ? AppPalette.whiteColor
                                        : AppPalette.accentColor,
                                    fontSize: 11,
                                    height: 1,
                                    overflow: TextOverflow.ellipsis,

                                    // letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 13,
                                color: context.read<ThemeCubit>().state ==
                                        Themes.dark
                                    ? AppPalette.whiteColor
                                    : AppPalette.greyColor,
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
                                    color: context.read<ThemeCubit>().state ==
                                            Themes.dark
                                        ? AppPalette.whiteColor
                                        : AppPalette.greyColor,
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
              ],
            ),
          ),
        );
      // },
    // );
  }
}

String timePosted(DateTime date) {
  return DateFormat.yMMMMd().format(date);
}
