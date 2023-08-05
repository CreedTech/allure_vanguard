import 'package:allure_vanguard/components/component_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/component_theme.dart';
import '../../../helpers/helper_routes_path.dart';
import '../../../helpers/helper_utils.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 50),
      () => Navigator.of(context).pushNamedAndRemoveUntil(
        home,
        (route) => false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Guide.isDark(context) ? colorsBlack : colorWhite,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: Image.asset(
                    "assets/icons/app.jpg",
                    width: 130.w,
                    height: 130.w,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("An Application Made With")
                          .normalSized(12)
                          .colors(Guide.isDark(context)
                              ? darkThemeText
                              : colorTextGray),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
