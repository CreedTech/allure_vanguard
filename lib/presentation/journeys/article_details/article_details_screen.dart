import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/size_constants.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../di/get_it.dart';
import '../../blocs/article_detail/article_detail_cubit.dart';
import '../../blocs/favourite/favorite_cubit.dart';
import '../../widgets/app_error_widget.dart';
import 'article_detail_arguments.dart';
import 'big_poster.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final ArticleDetailArguments articleDetailArguments;

  const ArticleDetailsScreen({
    Key? key,
    required this.articleDetailArguments,
  }) : super(key: key);

  @override
  _ArticleDetailsScreenState createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  late ArticleDetailCubit _articleDetailCubit;
  late FavoriteCubit _favoriteCubit;

  @override
  void initState() {
    super.initState();
    _articleDetailCubit = getItInstance<ArticleDetailCubit>();
    _favoriteCubit = _articleDetailCubit.favoriteCubit;
    _articleDetailCubit.loadArticleDetail(widget.articleDetailArguments.articleId);
  }

  @override
  void dispose() {
    _articleDetailCubit.close();
    _favoriteCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _articleDetailCubit),
          BlocProvider.value(value: _favoriteCubit),
        ],
        child: BlocBuilder<ArticleDetailCubit, ArticleDetailState>(
          builder: (context, state) {
            if (state is ArticleDetailLoaded) {
              final articleDetail = state.articleDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      article: articleDetail,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w,
                        vertical: Sizes.dimen_8.h,
                      ),
                      child: Text(
                        articleDetail.content ?? '',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ArticleDetailError) {
              return AppErrorWidget(
                errorType: state.errorType,
                onPressed: () => {},
                //     latestArticlesCubit.movieTabChanged(
                //   currentTabIndex: state.currentTabIndex,
                // ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
