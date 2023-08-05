import 'package:allure_vanguard/config/constants/palettes.dart';
import 'package:allure_vanguard/presentation/journeys/home/home_screen.dart';
import 'package:allure_vanguard/presentation/journeys/intro/intro_screen.dart';
import 'package:allure_vanguard/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/theme/theme_cubit.dart';

import '../common/constants/route_constants.dart';
import '../common/screenutil/screenutil.dart';
import '../di/get_it.dart';
import 'blocs/loading/loading_cubit.dart';
import 'fade_page_route_builder.dart';
import 'journeys/loading/loading_screen.dart';
import 'routes.dart';

class ArticleApp extends StatefulWidget {
  @override
  _ArticleAppState createState() => _ArticleAppState();
}

class _ArticleAppState extends State<ArticleApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late LoadingCubit _loadingCubit;
  late ThemeCubit _themeCubit;

  @override
  void initState() {
    super.initState();
    // _languageCubit = getItInstance<LanguageCubit>();
    // _languageCubit.loadPreferredLanguage();
    // _loginBloc = getItInstance<LoginCubit>();
    _loadingCubit = getItInstance<LoadingCubit>();
    _themeCubit = getItInstance<ThemeCubit>();
    _themeCubit.loadPreferredTheme();
  }

  @override
  void dispose() {
    _loadingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoadingCubit>.value(value: _loadingCubit),
        BlocProvider<ThemeCubit>.value(value: _themeCubit),
      ],
      child: BlocBuilder<ThemeCubit, Themes>(
        builder: (context, theme) {
          return MaterialApp(
            navigatorKey: _navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Allure Vanguard',
            theme: ThemeData(
              unselectedWidgetColor: AppPalette.accentColor,
              primaryColor: theme == Themes.dark
                  ? AppPalette.blackColor
                  : AppPalette.whiteColor,
              scaffoldBackgroundColor: theme == Themes.dark
                  ? AppPalette.blackColor
                  : AppPalette.whiteColor,
              cardTheme: CardTheme(
                color: theme == Themes.dark
                    ? AppPalette.whiteColor
                    : AppPalette.blackColor,
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: theme == Themes.dark
                  ? ThemeText.getTextTheme()
                  : ThemeText.getLightTextTheme(),
              appBarTheme: AppBarTheme(elevation: 0,
              backgroundColor: theme == Themes.dark
                  ? AppPalette.blackColor
                  : AppPalette.whiteColor,
              ),
              inputDecorationTheme: InputDecorationTheme(
                hintStyle: Theme.of(context).textTheme.greySubtitle1,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: theme == Themes.dark
                        ? AppPalette.whiteColor
                        : AppPalette.blackColor,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: AppPalette.drawerColor)
                  .copyWith(
                    brightness: theme == Themes.dark
                        ? Brightness.dark
                        : Brightness.light,
                  ),
            ),
            builder: (context, child) {
              return LoadingScreen(
                screen: child!,
              );
            },
            initialRoute: RouteList.initial,
            onGenerateRoute: (RouteSettings settings) {
              final routes = Routes.getRoutes(settings);
              final WidgetBuilder? builder = routes[settings.name];
              return FadePageRouteBuilder(
                builder: builder!,
                settings: settings,
              );
            },
          );
        },
      ),
    );
  }
}
