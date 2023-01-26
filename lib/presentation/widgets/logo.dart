import 'package:allure_vanguard/common/constants/assets.dart';
import 'package:allure_vanguard/common/constants/palettes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/extensions/size_extensions.dart';
import '../blocs/theme/theme_cubit.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({
    Key? key,
    required this.height,
  })   : assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.splashImage,
      key: const ValueKey('logo_image_key'),
      // color: context.read<ThemeCubit>().state == Themes.dark
      //     ? Colors.white
      //     : AppPalette.blackColor,
      height: height.h,
    );
  }
}
