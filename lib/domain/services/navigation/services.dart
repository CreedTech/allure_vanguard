part of navigation;

class NavigationService {
  static final navigationKey = GlobalKey<NavigatorState>();

  const NavigationService();

  void openSplashPage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.splash)
          : Navigator.pushNamed(context, NavigationRoutes.splash);
  void openHomePage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.home)
          : Navigator.pushNamed(context, NavigationRoutes.home);
  void openIntroPage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.intro)
          : Navigator.pushNamed(context, NavigationRoutes.intro);
  void openErrorPage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.errorPage)
          : Navigator.pushNamed(context, NavigationRoutes.errorPage);

  void back(BuildContext context, {dynamic result}) =>
      Navigator.pop(context, result);
}