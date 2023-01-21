part of widgets;

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 5.h,
          width: 20.w,
          // alignment: Alignment.center,
          color: AppPalette.transparentColor,
          child: Image.asset(AppImages.splashImage),
        ),
      ],
    );
  }
}
