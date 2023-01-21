part of widgets;

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            width: 30.w,
            decoration: BoxDecoration(
              color: AppPalette.accentColor,
            ),
            child: Text(
              "Trending".toUpperCase(),
              style: TextStyle(
                color: AppPalette.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            width: 65.w,
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
  }
}
