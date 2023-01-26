part of pages;

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            HomeAppbar(),
            HeadlineSliderWidget(),
            SectionHeader(),
            NewsCard(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 0.1.h,
                decoration: BoxDecoration(
                  color: AppPalette.greyColor,
                ),
              ),
            ),
           NewsList(),
          ],
        ),
      ),
    );
  }
}

// class Carousel extends StatefulWidget {
//   const Carousel({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<Carousel> createState() => _CarouselState();
// }
//
// class _CarouselState extends State<Carousel> {
//   List<String> images = [
//     "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
//     "https://wallpaperaccess.com/full/2637581.jpg",
//     "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
//   ];
//
//   int activePage = 0;
//   //
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _pageController = PageController(viewportFraction: 1, initialPage: 0);
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         HeadlineSliderWidget(),
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//             children: <Widget>[
//               Text(
//                 "Top channels",
//                 style: TextStyle(
//                     color: AppPalette.accentColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 17.0),
//               ),
//             ],
//           ),
//         ),
//         // TopChannelsWidget(),
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//             children: <Widget>[
//               Text(
//                 "Hot news",
//                 style: TextStyle(
//                     color: AppPalette.accentColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 17.0),
//               ),
//             ],
//           ),
//         ),
//         // HotNewsWidget()
//       ],
//     );
//   }
// }
//
// AnimatedContainer slider(images, pagePosition, active) {
//   double margin = active ? 10 : 20;
//
//   return AnimatedContainer(
//     duration: Duration(milliseconds: 200),
//     curve: Curves.bounceIn,
//     // margin: EdgeInsets.all(margin),
//     child: Image.network(images[pagePosition]),
//     // decoration: BoxDecoration(
//     //     image: DecorationImage(image: NetworkImage(images[pagePosition]))),
//   );
// }

// imageAnimation(PageController animation, images, pagePosition) {
//   return AnimatedBuilder(
//     animation: animation,
//     builder: (context, widget) {
//       print(pagePosition);
//
//       return SizedBox(
//         width: 200,
//         height: 200,
//         child: widget,
//       );
//     },
//     child: Container(
//       margin: EdgeInsets.all(10),
//       child: Image.network(images[pagePosition]),
//     ),
//   );
// }
//
// List<Widget> indicators(imagesLength, currentIndex) {
//   return List<Widget>.generate(imagesLength, (index) {
//     return Container(
//       margin: EdgeInsets.all(3),
//       width: 10,
//       height: 10,
//       decoration: BoxDecoration(
//           color: currentIndex == index ? Colors.black : Colors.black26,
//           shape: BoxShape.circle),
//     );
//   });
// }
