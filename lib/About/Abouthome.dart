import 'package:abigail_askbilly/About/AboutItem.dart';
import 'package:abigail_askbilly/About/Admission.dart';
import 'package:abigail_askbilly/About/ContactUs.dart';
import 'package:abigail_askbilly/About/Scholarship.dart';
import 'package:abigail_askbilly/About/Trial.dart';
import 'package:abigail_askbilly/Classes/AboutButton.dart';
import 'package:abigail_askbilly/HomePage/Homepage.dart';
import 'package:abigail_askbilly/LoadingPage/Loadingpage.dart';
import 'package:abigail_askbilly/Maps/Mapshome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../LandingPage/Landingpage.dart';
import '../MenuBar.dart';

class aboutHome extends StatefulWidget {
  @override
  State<aboutHome> createState() => _aboutHomeState();
}

class _aboutHomeState extends State<aboutHome> {
  var size, height, width;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final titleStyle = TextStyle(fontSize: 6.h, color: HexColor('061e47'));
  final btnStyle = TextStyle(fontSize: 3.h, color: Colors.white);
  final textTitleStyle = TextStyle(fontSize: 7.h, color: HexColor('061e47'));
  final contentStyle = TextStyle(fontSize: 3.h, color: HexColor('061e47'));

  late Future<AboutButton> futureAbout;
  List<AboutButton> menuButtons = [
    AboutButton(icon: Icons.info_outline, label: "About NU"),
    AboutButton(icon: Icons.school, label: "Scholarship"),
    AboutButton(icon: Icons.perm_contact_cal, label: "Admission"),
    AboutButton(icon: Icons.call, label: "Contact Us"),
  ];


  @override
  void initState() {
    super.initState();
    futureAbout = getAbout();
  }
  Future<AboutButton> getAbout() async {
    Response response;
    response = await
  }

  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        drawerScrimColor: Colors.transparent,
        key: _scaffoldKey,
        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: menuBar(),
        ),
        body: Container(
          height: 100.h,
          width: width,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(6),
                width: width,
                height: 8.h,
                decoration: BoxDecoration(
                  color: HexColor('dee7f0'),
                  image: DecorationImage(
                    image: AssetImage('assets/paws.gif'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        'assets/BurgerMenu.png',
                        height: 4.h,
                      ),
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      'About NU',
                      style: GoogleFonts.montserrat(
                          textStyle: titleStyle,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Image.asset(
                      'assets/logo.png',
                      height: 7.h,
                    ),
                  ],
                ),
              ), //TOPBAR

              Container(
                color: HexColor('af9f30'),
                height: 2.h,
                width: width,
              ),

              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 100.h,
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                        color: HexColor('dee7f0'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.w, top: 3.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: menuButtons
                              .map((menu) => AboutItem(
                                    icon: menu.icon,
                                    label: menu.label,
                                  ))
                              .toList()),
                    ),
                    Trial(),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(bottom: 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/BackBtn.png',
                          height: 10.h,
                          width: 10.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: HexColor('061e47'),
                height: 2.h,
                width: width,
              ),
            ],
          ),
        ));
  }

}
