// part of pages;
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int selectBtn = 0;
//
//   /// Controller to handle PageView and also handles initial page
//   final _pageController = PageController(initialPage: 0);
//
//   int maxCount = 5;
//
//   /// widget list
//   final = = [
//     const IntroPage(),
//     const CategoriesPage(),
//   const Page3(),
//     const Page4(),
//     const Page5(),
//   ];
//
//   GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
//   NavigationService get navigation =>
//       Provider.of<NavigationService>(context, listen: false);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: PageView(
//           controller: _pageController,
//           // physics: const NeverScrollableScrollPhysics(),
//           children: List.generate(
//               bottomBarPages.length, (index) => bottomBarPages[index]),
//         ),
//       ),
//       extendBody: true,
//       bottomNavigationBar: (bottomBarPages.length <= maxCount)
//           ? AnimatedNotchBottomBar(
//               pageController: _pageController,
//               color: Colors.white,
//               showLabel: true,
//               notchColor: AppPalette.accentColor,
//               bottomBarItems: [
//                 const BottomBarItem(
//                   inActiveItem: Icon(
//                     Icons.home_outlined,
//                     color: AppPalette.accentColor,
//                   ),
//                   activeItem: Icon(
//                     Icons.home_filled,
//                     color: AppPalette.whiteColor,
//                   ),
//                   itemLabel: 'Home',
//                 ),
//
//                 ///svg example
//                 BottomBarItem(
//                   inActiveItem: Icon(
//                     Icons.search,
//                     color: AppPalette.accentColor,
//                   ),
//                   activeItem: Icon(
//                     Icons.saved_search_rounded,
//                     color: AppPalette.whiteColor,
//                   ),
//                   itemLabel: 'Search',
//                 ),
//                 const BottomBarItem(
//                   inActiveItem: Icon(
//                     Icons.bookmark_outline,
//                     color: AppPalette.accentColor,
//                   ),
//                   activeItem: Icon(
//                     Icons.bookmark,
//                     color: AppPalette.whiteColor,
//                   ),
//                   itemLabel: 'Bookmark',
//                 ),
//                 const BottomBarItem(
//                   inActiveItem: Icon(
//                     Icons.settings_outlined,
//                     color: AppPalette.accentColor,
//                   ),
//                   activeItem: Icon(
//                     Icons.settings,
//                     color: AppPalette.whiteColor,
//                   ),
//                   itemLabel: 'Settings',
//                 ),
//               ],
//               onTap: (index) {
//                 /// control your animation using page controller
//                 _pageController.animateToPage(
//                   index,
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.easeIn,
//                 );
//               },
//             )
//           : null,
//     );
//   }
// }
//
// class Page1 extends StatelessWidget {
//   const Page1({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.yellow, child: const Center(child: Text('Page 1')));
//   }
// }
//
// class Page2 extends StatelessWidget {
//   const Page2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.green, child: const Center(child: Text('Page 2')));
//   }
// }
//
// class Page3 extends StatelessWidget {
//   const Page3({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.red, child: const Center(child: Text('Page 3')));
//   }
// }
//
// class Page4 extends StatelessWidget {
//   const Page4({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.blue, child: const Center(child: Text('Page 4')));
//   }
// }
//
// class Page5 extends StatelessWidget {
//   const Page5({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.lightGreenAccent,
//         child: const Center(child: Text('Page 4')));
//   }
// }
