import 'package:allure_vanguard/config/constants/palettes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../../common/extensions/string_extensions.dart';
import '../blocs/theme/theme_cubit.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isEnabled;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Themes>(
      builder: (context, theme) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            color: context.read<ThemeCubit>().state == Themes.dark
                ? AppPalette.whiteColor
                : AppPalette.blackColor,
            borderRadius: BorderRadius.all(
              Radius.circular(Sizes.dimen_20.w),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
          margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
          height: Sizes.dimen_16.h,
          child: TextButton(
            key: const ValueKey('main_button'),
            onPressed: isEnabled ? onPressed : null,
            child: Text(
              text,
              style:
              TextStyle(
                fontWeight: FontWeight.w800,
                color: context.read<ThemeCubit>().state == Themes.dark
                    ? AppPalette.blackColor
                    : AppPalette.whiteColor,
              )
              // Theme.of(context).textTheme.button
              ,
            ),
          ),
        );
      },
    );
  }
}
