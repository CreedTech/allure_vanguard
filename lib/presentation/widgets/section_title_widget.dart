
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants/palettes.dart';
import '../../common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../blocs/theme/theme_cubit.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Themes>(
        builder: (context, theme)
    {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              // height: Sizes.dimen_14.h,
              // width: Sizes.dimen_80.w,
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              width: Sizes.dimen_160.w,
              decoration: BoxDecoration(
                color: context.read<ThemeCubit>().state == Themes.dark
                    ? AppPalette.whiteColor
                    : AppPalette.accentColor,
              ),
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: context.read<ThemeCubit>().state == Themes.dark
                      ? AppPalette.blackColor
                      : AppPalette.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
            ),
            Container(
              // height: Sizes.dimen_14.h,
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              width: Sizes.dimen_230.w,
              decoration: BoxDecoration(
                color: AppPalette.drawerColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ],
        ),
      );
    },);
  }
}
