import 'package:allure_vanguard/common/constants/palettes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/article_detail_entity.dart';
import '../../../domain/entities/article_entity.dart';
import '../../blocs/favourite/favorite_cubit.dart';
import '../../blocs/theme/theme_cubit.dart';

import '../../../common/constants/size_constants.dart';
import '../../../common/extensions/size_extensions.dart';

class ArticleDetailAppBar extends StatelessWidget {
  final ArticleDetailEntity articleDetailEntity;

  const ArticleDetailAppBar({
    Key? key,
    required this.articleDetailEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: context.read<ThemeCubit>().state == Themes.dark
                ? AppPalette.accentColor
                : AppPalette.accentColor,
            size: Sizes.dimen_12.h,
          ),
        ),
        BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is IsFavoriteArticle) {
              return GestureDetector(
                onTap: () =>
                    BlocProvider.of<FavoriteCubit>(context).toggleFavoriteArticle(
                      ArticleEntity.fromArticleDetailEntity(articleDetailEntity),
                      state.isArticleFavorite,
                    ),
                child: Icon(
                  state.isArticleFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: context.read<ThemeCubit>().state == Themes.dark
                      ? AppPalette.accentColor
                      : AppPalette.accentColor,
                  size: Sizes.dimen_12.h,
                ),
              );
            } else {
              return Icon(
                Icons.favorite_border,
                color: context.read<ThemeCubit>().state == Themes.dark
                    ? AppPalette.accentColor
                    : AppPalette.accentColor,
                size: Sizes.dimen_12.h,
              );
            }
          },
        ),
      ],
    );
  }
}
