import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../../common/screenutil/screenutil.dart';
import 'logo.dart';

class ArticleAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Logo(height: Sizes.dimen_14)),
        // IconButton(
        //   onPressed: () {
        //     showSearch(
        //       context: context,
        //       delegate: CustomSearchDelegate(
        //         BlocProvider.of<SearchMovieCubit>(context),
        //       ),
        //     );
        //   },
        //   icon: Icon(
        //     Icons.search,
        //     color: context.read<ThemeCubit>().state == Themes.dark
        //         ? Colors.white
        //         : AppColor.vulcan,
        //     size: Sizes.dimen_12.h,
        //   ),
        // ),
      ],
    );
  }
}
