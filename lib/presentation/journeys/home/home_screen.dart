import 'package:allure_vanguard/common/constants/size_constants.dart';
import 'package:allure_vanguard/common/extensions/size_extensions.dart';
import 'package:allure_vanguard/presentation/blocs/latest_articles/latest_articles_cubit.dart';
import 'package:allure_vanguard/presentation/journeys/categories/categories_screen.dart';
import 'package:allure_vanguard/presentation/journeys/favourites/favourites_screen.dart';
import 'package:allure_vanguard/presentation/widgets/section_title_widget.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/palettes.dart';
import '../../../di/get_it.dart';
import '../../blocs/article_carousel/article_carousel_cubit.dart';
import '../../widgets/app_error_widget.dart';
import '../../widgets/article_app_bar.dart';
import '../settings/settings_screen.dart';
import 'article_carousel/article_carousel_widget.dart';
import 'latest_articles/article_tabbed_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  /// Controller to handle PageView and also handles initial page


  late ArticleCarouselCubit articleCarouselCubit;
  late LatestArticlesCubit latestArticlesCubit;

  @override
  void initState() {
    super.initState();
    articleCarouselCubit = getItInstance<ArticleCarouselCubit>();
    articleCarouselCubit.loadCarousel();
    latestArticlesCubit = getItInstance<LatestArticlesCubit>();
    latestArticlesCubit.loadArticle();
  }

  @override
  void dispose() {
    super.dispose();
    articleCarouselCubit.close();
    latestArticlesCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => articleCarouselCubit,
        ),
        BlocProvider(
          create: (context) => latestArticlesCubit,
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<ArticleCarouselCubit, ArticleCarouselState>(
          builder: (context, state) {
            if (state is ArticleCarouselLoaded) {
              return SingleChildScrollView(
                // physics: const BouncingScrollPhysics(),
                child: Column(
                  // fit: StackFit.expand,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ArticleAppBar(),
                    ArticleCarouselWidget(
                      articles: state.articles,
                      defaultIndex: state.defaultIndex,
                    ),
                    SectionTitle(title: "Latest News",),
                    ArticleTabbedWidget(),
                  ],
                ),
              );
            } else if (state is ArticleCarouselError) {
              return AppErrorWidget(
                onPressed: () => articleCarouselCubit.loadCarousel(),
                errorType: state.errorType,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
