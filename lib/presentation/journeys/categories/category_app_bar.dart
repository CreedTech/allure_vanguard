import 'package:allure_vanguard/common/constants/palettes.dart';
import 'package:allure_vanguard/common/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constants/size_constants.dart';
import '../../../common/screenutil/screenutil.dart';
import '../../blocs/search_article/search_article_cubit.dart';
import '../../blocs/theme/theme_cubit.dart';
import '../../widgets/logo.dart';
import '../search_article/custom_search_article_delegate.dart';

class CategoryAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        // top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Logo(height: Sizes.dimen_14),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                  BlocProvider.of<SearchArticleCubit>(context),
                ),
              );
            },
            icon: Icon(
              Icons.search,
              color: context.read<ThemeCubit>().state == Themes.dark
                  ? AppPalette.whiteColor
                  : AppPalette.accentColor,
              size: Sizes.dimen_12.h,
            ),
          ),
        ],
      ),
    );
  }
}
