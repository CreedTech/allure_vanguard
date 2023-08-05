// part of pages;
//
//
// class SplashPage extends StatefulWidget {
//   const SplashPage({Key? key}) : super(key: key);
//
//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }
//
// class _SplashPageState extends State<SplashPage> {
//   @override
//   void initState() {
//     super.initState();
//     _openPages();
//   }
//
//   Future<void> _openPages() async {
//     Timer(const Duration(seconds: 4), _openHomePage);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppPalette.whiteColor,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: const <Widget>[
//           SplashAnimation(),
//         ],
//       ),
//     );
//   }
//
//   void _openHomePage() {
//     Provider.of<NavigationService>(context, listen: false)
//         .openHomePage(context, withReplacement: true);
//   }
// }