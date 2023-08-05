import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/palettes.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../di/get_it.dart';
import '../../blocs/favourite/favorite_cubit.dart';
import '../../blocs/theme/theme_cubit.dart';
import 'bookmark_article_grid_view.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  late FavoriteCubit _favoriteBloc;

  @override
  void initState() {
    super.initState();
    _favoriteBloc = getItInstance<FavoriteCubit>();
    _favoriteBloc.loadFavoriteArticle();
  }

  @override
  void dispose() {
    _favoriteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Themes>(
      builder: (context, theme) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: context.read<ThemeCubit>().state == Themes.dark
                ? AppPalette.blackColor
                : AppPalette.whiteColor,
            title: Text(
              TranslationConstants.favoriteArticles,
              style: TextStyle(
                  height: 1.5,
                  color: context.read<ThemeCubit>().state == Themes.dark
                      ? AppPalette.whiteColor
                      : AppPalette.blackColor,
                  fontWeight: FontWeight.w800,
                  overflow: TextOverflow.fade,
                  fontSize: 20.0),
            ),
          ),
          body: BlocProvider.value(
            value: _favoriteBloc,
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                if (state is FavoriteArticlesLoaded) {
                  if (state.articles.isEmpty) {
                    return Center(
                      child: Text(
                        TranslationConstants.noFavoriteArticle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.5,
                            color:
                                context.read<ThemeCubit>().state == Themes.dark
                                    ? AppPalette.whiteColor
                                    : AppPalette.blackColor,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.fade,
                            fontSize: 15.0),
                      ),
                    );
                  }
                  return FavoriteArticleGridView(
                    articles: state.articles,
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        );
      },
    );
  }
}
