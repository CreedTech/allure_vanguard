import 'package:allure_vanguard/presentation/blocs/latest_articles/latest_articles_cubit.dart';
import 'package:allure_vanguard/presentation/blocs/latest_articles/latest_articles_cubit.dart';
import 'package:allure_vanguard/presentation/blocs/latest_articles/latest_articles_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants/size_constants.dart';
import '../../../../common/constants/translation_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/extensions/string_extensions.dart';
import '../../../widgets/app_error_widget.dart';
import '../../loading/loading_circle.dart';
import 'article_list_view_builder.dart';

class ArticleTabbedWidget extends StatefulWidget {
  @override
  _ArticleTabbedWidgetState createState() => _ArticleTabbedWidgetState();
}

class _ArticleTabbedWidgetState extends State<ArticleTabbedWidget>
    with SingleTickerProviderStateMixin {
  LatestArticlesCubit get latestArticlesCubit =>
      BlocProvider.of<LatestArticlesCubit>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    // latestArticlesCubit.movieTabChanged(currentTabIndex: currentTabIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestArticlesCubit, LatestArticlesState>(
      builder: (context, state) {
        if (state is LatestArticlesLoaded) {
          return Padding(
            padding: EdgeInsets.only(bottom: Sizes.dimen_4.h),
            child: Container(
              // height: MediaQuery.of(context).size.height,
              //   constraints: const BoxConstraints(minHeight: 0,),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  state.articles.isEmpty
                      ? Flexible(
                          fit: FlexFit.loose,
                          child: Center(
                            child: Text(
                              TranslationConstants.noArticles,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      : ArticleListViewBuilder(articles: state.articles),
                  // if (state is LatestArticlesError)
                  //   Flexible(
                  //     fit: FlexFit.loose,
                  //     child: AppErrorWidget(
                  //       errorType: state.errorType,
                  //       onPressed: () => {},
                  //       //     latestArticlesCubit.movieTabChanged(
                  //       //   currentTabIndex: state.currentTabIndex,
                  //       // ),
                  //     ),
                  //   ),
                  // if (state is !LatestArticlesLoaded)
                  //   Flexible(
                  //     fit: FlexFit.loose,
                  //     child: Center(
                  //       child: LoadingCircle(
                  //         size: Sizes.dimen_100.w,
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
          );
        } else if (state is LatestArticlesError) {
          return AppErrorWidget(
            errorType: state.errorType,
            onPressed: () => latestArticlesCubit.loadArticle(),
            //     latestArticlesCubit.movieTabChanged(
            //   currentTabIndex: state.currentTabIndex,
            // ),
          );
        } else {
          return Flexible(
            fit: FlexFit.loose,
            child: Center(
              child: LoadingCircle(
                size: Sizes.dimen_100.w,
              ),
            ),
          );
        }
      },
    );
  }

  // void _onTabTapped(int index) {
  //   latestArticlesCubit.movieTabChanged(currentTabIndex: index);
  // }
}
