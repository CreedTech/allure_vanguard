import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wiredash/wiredash.dart';

import '../../common/constants/palettes.dart';
import '../../common/constants/size_constants.dart';
import '../../common/constants/translation_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../../common/extensions/string_extensions.dart';
import '../../domain/entities/app_error.dart';
import '../blocs/theme/theme_cubit.dart';
import 'button.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function() onPressed;

  const AppErrorWidget({
    Key? key,
    required this.errorType,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Themes>(
      builder: (context, theme) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
          child: Center(
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  errorType == AppErrorType.api
                      ? TranslationConstants.somethingWentWrong
                      : TranslationConstants.checkNetwork,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    color: context.read<ThemeCubit>().state == Themes.dark
                        ? AppPalette.whiteColor
                        : AppPalette.blackColor,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.fade,
                    fontSize: 12.0,
                  ),
                ),
                Button(
                  onPressed: onPressed,
                  text: TranslationConstants.retry,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
