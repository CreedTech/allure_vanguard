import 'package:allure_vanguard/common/constants/palettes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/size_constants.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/extensions/string_extensions.dart';
import '../../blocs/search_article/search_article_cubit.dart';
import '../../blocs/theme/theme_cubit.dart';
import '../../widgets/app_error_widget.dart';
import 'search_article_card.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchArticleCubit searchArticleCubit;

  CustomSearchDelegate(this.searchArticleCubit);

  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : Theme.of(context).colorScheme.secondary,
        ),
        onPressed: query.isEmpty ? null : () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: context.read<ThemeCubit>().state == Themes.dark
            ? Colors.white
            : AppPalette.accentColor,
        size: Sizes.dimen_12.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchArticleCubit.searchTermChanged(query);

    return BlocBuilder<SearchArticleCubit, SearchArticleState>(
      bloc: searchArticleCubit,
      builder: (context, state) {
        if (state is SearchArticleError) {
          return AppErrorWidget(
            errorType: state.errorType,
            onPressed: () => searchArticleCubit.searchTermChanged(query),
          );
        } else if (state is SearchArticleLoaded) {
          final articles = state.articles;
          if (articles.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_64.w),
                child: Text(
                  TranslationConstants.noArticlesSearched,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => SearchArticleCard(
              article: articles[index],
            ),
            itemCount: articles.length,
            scrollDirection: Axis.vertical,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
