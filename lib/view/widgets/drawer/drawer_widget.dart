import 'package:allure_vanguard/config/constants/palettes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    final menus = [
      {
        "title": "Top Menu",
        "icon": Icon(
          Icons.home,
          color: Theme.of(context).primaryColor,
        ),
        "route": "/"
      },
      {
        "title": "Main Menu",
        "icon": Icon(
          Icons.ac_unit,
          color: Theme.of(context).primaryColor,
        ),
        "route": "/ocr"
      },
    ];
    final submenus = [
      {
        "title": "Top Menu",
        "icon": Icon(
          Icons.home,
          color: Theme.of(context).primaryColor,
        ),
        "route": "/"
      },
      {
        "title": "Main Menu",
        "icon": Icon(
          Icons.ac_unit,
          color: Theme.of(context).primaryColor,
        ),
        "route": "/ocr"
      },
      {
        "title": "Face Detector",
        "icon": Icon(
          Icons.face,
          color: Theme.of(context).primaryColor,
        ),
        "route": "/face"
      },
      {
        "title": "QR Code Generator",
        "icon": Icon(
          Icons.qr_code,
          color: Theme.of(context).primaryColor,
        ),
        "route": "/QR"
      },
      {
        "title": "QR Scan",
        "icon": Icon(
          Icons.qr_code,
          color: Theme.of(context).primaryColor,
        ),
        "route": "/scanQR"
      },
      // {"title":"Graphics", "icon": Icon(Icons.grading, color: Theme.of(context).primaryColor,), "route":"/graphics"},
      // {"title":"Github Users", "icon": Icon(Icons.verified_user, color: Theme.of(context).primaryColor,), "route":"/users"},
    ];
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 10.w,
              decoration: BoxDecoration(
                color: AppPalette.blackColor,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      color: AppPalette.whiteColor,
                    ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    'Vanguard Allure'.toUpperCase(),
                    style: TextStyle(
                      color: AppPalette.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
