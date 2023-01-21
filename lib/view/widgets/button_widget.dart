part of widgets;

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onButtonTap;

  const ButtonWidget({Key? key, required this.title, required this.onButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late bool hoverColor = false;
    return Container(
      width: 20.w,
      padding: EdgeInsets.all(5),
      // height: 2.h,
      margin: EdgeInsets.only(top: 2.h),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppPalette.accentColor,
          ),
          left: BorderSide(
            color: AppPalette.accentColor,
          ),
          bottom: BorderSide(
            color: AppPalette.accentColor,
          ),
          right: BorderSide(
            color: AppPalette.accentColor,
          ),
        ),
        // borderRadius: BorderRadius.circular(10),
        color:
            hoverColor ? AppPalette.accentColor : AppPalette.transparentColor,
      ),
      child: Material(
        color:
            hoverColor ? AppPalette.accentColor : AppPalette.transparentColor,
        child: InkWell(
            onTap: onButtonTap,
            // onHover: (hovered) {
            //   setState(() {
            //     hoverColor = hovered;
            //   });
            // },
            child: Center(
              child: Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppPalette.blackColor,
                  fontSize: 10,
                ),
              ),
            )),
      ),
    );
  }
}
