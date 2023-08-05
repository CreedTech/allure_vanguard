import 'package:allure_vanguard/common/extensions/size_extensions.dart';
import 'package:allure_vanguard/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/palettes.dart';
import '../../../common/constants/size_constants.dart';
import '../../blocs/theme/theme_cubit.dart';
import '../../widgets/logo.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _theme = true;
  bool _notification = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Themes>(
      builder: (context, theme) {
        return
          Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.7),
                blurRadius: 4,
              ),
            ],
          ),
          width: double.infinity,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: Sizes.dimen_8.h,
                    bottom: Sizes.dimen_8.h,
                    left: Sizes.dimen_8.w,
                    right: Sizes.dimen_8.w,
                  ),
                  child: Center(child: Text("Settings")),
                ),
                // BlocBuilder<ThemeCubit, Themes>(builder: (context, theme) {
                //   return
                SwitchListTile(
                  title: Text(
                    'Notifications',
                  ),
                  secondary: Icon(
                    theme == Themes.dark
                        ? Icons.notifications_active_outlined
                        : Icons.notifications_active_outlined,
                    color: context.read<ThemeCubit>().state == Themes.dark
                        ? AppPalette.whiteColor
                        : AppPalette.blackColor,
                    size: Sizes.dimen_20.w,
                  ),
                  onChanged: (bool value) {
                    setState(() {
                      _notification = value;
                    });
                    // context.read<ThemeCubit>().toggleTheme();
                  },
                  value: _notification,
                ),
                SwitchListTile(
                  title: Text(
                    'Light Theme',
                  ),
                  secondary: Icon(
                    theme == Themes.dark
                        ? Icons.brightness_4_sharp
                        : Icons.brightness_7_sharp,
                    color: context.read<ThemeCubit>().state == Themes.dark
                        ? AppPalette.whiteColor
                        : AppPalette.blackColor,
                    size: Sizes.dimen_20.w,
                  ),
                  onChanged: (bool value) {
                    setState(() {
                      _theme = value;
                    });
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  value: _theme,
                ),
                ListTile(
                  title: Text("About us"),
                  leading: Icon(
                    theme == Themes.dark
                        ? Icons.newspaper_outlined
                        : Icons.newspaper_outlined,
                    color: context.read<ThemeCubit>().state == Themes.dark
                        ? AppPalette.whiteColor
                        : AppPalette.blackColor,
                    size: Sizes.dimen_20.w,
                  ),
                ),
                ListTile(
                  title: Text("Contact us"),
                  leading: Icon(
                    theme == Themes.dark
                        ? Icons.contact_mail_outlined
                        : Icons.contact_mail_outlined,
                    color: context.read<ThemeCubit>().state == Themes.dark
                        ? AppPalette.whiteColor
                        : AppPalette.blackColor,
                    size: Sizes.dimen_20.w,
                  ),
                ),
                ListTile(
                  title: Text("Newsletter"),
                  leading: Icon(
                    theme == Themes.dark
                        ? Icons.newspaper_outlined
                        : Icons.newspaper_outlined,
                    color: context.read<ThemeCubit>().state == Themes.dark
                        ? AppPalette.whiteColor
                        : AppPalette.blackColor,
                    size: Sizes.dimen_20.w,
                  ),

                ),
                ListTile(
                  title: Text("Privacy Policy"),
                  leading: Icon(
                    theme == Themes.dark
                        ? Icons.privacy_tip_outlined
                        : Icons.privacy_tip_outlined,
                    color: context.read<ThemeCubit>().state == Themes.dark
                        ? AppPalette.whiteColor
                        : AppPalette.blackColor,
                    size: Sizes.dimen_20.w,
                  ),
                ),
                ListTile(
                  title: Text("Rate Us"),
                  leading: Icon(
                    theme == Themes.dark
                        ? Icons.star_border_outlined
                        : Icons.star_border_outlined,
                    color: context.read<ThemeCubit>().state == Themes.dark
                        ? AppPalette.whiteColor
                        : AppPalette.blackColor,
                    size: Sizes.dimen_20.w,
                  ),
                ),
                ListTile(
                  title: Text("Share App"),
                  leading: Icon(
                    theme == Themes.dark
                        ? Icons.share_outlined
                        : Icons.share_outlined,
                    color: context.read<ThemeCubit>().state == Themes.dark
                        ? AppPalette.whiteColor
                        : AppPalette.blackColor,
                    size: Sizes.dimen_20.w,
                  ),
                ),
                ListTile(
                  title: Text("Advertise with us"),
                  leading: Icon(
                    theme == Themes.dark
                        ? Icons.nest_cam_wired_stand_outlined
                        : Icons.nest_cam_wired_stand_outlined,
                    color: context.read<ThemeCubit>().state == Themes.dark
                        ? AppPalette.whiteColor
                        : AppPalette.blackColor,
                    size: Sizes.dimen_20.w,
                  ),
                ),
                Spacer(),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text('Follow us'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_40.w,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () => {},
                        icon: Icon(
                          theme == Themes.dark
                              ? Icons.facebook
                              : Icons.facebook,
                          color: context.read<ThemeCubit>().state == Themes.dark
                              ? AppPalette.whiteColor
                              : AppPalette.blackColor,
                          size: Sizes.dimen_32.w,
                        ),
                      ),IconButton(
                        onPressed: () => {},
                        icon: Icon(
                          theme == Themes.dark
                              ? Icons.facebook
                              : Icons.facebook,
                          color: context.read<ThemeCubit>().state == Themes.dark
                              ? AppPalette.whiteColor
                              : AppPalette.blackColor,
                          size: Sizes.dimen_32.w,
                        ),
                      ),IconButton(
                        onPressed: () => {},
                        icon: Icon(
                          theme == Themes.dark
                              ? Icons.facebook
                              : Icons.facebook,
                          color: context.read<ThemeCubit>().state == Themes.dark
                              ? AppPalette.whiteColor
                              : AppPalette.blackColor,
                          size: Sizes.dimen_32.w,
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () => {},
                      //   icon: Icon(
                      //     theme == Themes.dark
                      //         ? Icons.whatsapp
                      //         : Icons.whatsapp,
                      //     color: context.read<ThemeCubit>().state == Themes.dark
                      //         ? AppPalette.whiteColor
                      //         : AppPalette.blackColor,
                      //     size: Sizes.dimen_32.w,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            // IconButton(
            //   onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            //   icon: Icon(
            //     theme == Themes.dark
            //         ? Icons.brightness_4_sharp
            //         : Icons.brightness_7_sharp,
            //     color: context.read<ThemeCubit>().state == Themes.dark
            //         ? AppPalette.whiteColor
            //         : AppPalette.blackColor,
            //     size: Sizes.dimen_20.w,
            //   ),
            // ),
          ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
