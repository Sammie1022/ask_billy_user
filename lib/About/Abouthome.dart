import 'package:abigail_askbilly/About/Admission.dart';
import 'package:abigail_askbilly/About/ContactUs.dart';
import 'package:abigail_askbilly/About/Scholarship.dart';
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
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final titleStyle = TextStyle(fontSize: 6.h, color: HexColor('061e47'));
  final btnStyle = TextStyle(fontSize: 3.h, color: Colors.white);
  final textTitleStyle = TextStyle(fontSize: 7.h, color: HexColor('061e47'));
  final contentStyle = TextStyle(fontSize: 3.h, color: HexColor('061e47'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerScrimColor: Colors.transparent,
        key: _scaffoldKey,
        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: menuBar(),
        ),
        body: Container(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(6),
                width: 100.w,
                height: 12.h,
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
                        height: 7.h,
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
                          textStyle: titleStyle, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Image.asset('assets/logo.png'),
                  ],
                ),
              ), //TOPBAR

              Container(
                color: HexColor('af9f30'),
                height: 2.h,
                width: 100.w,
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
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => aboutHome()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                primary: HexColor('061e47'),
                                elevation: 5,
                                // padding: EdgeInsets.symmetric(
                                //     vertical: 2.h, horizontal: 7.w),
                              ),
                              icon: Icon(
                                Icons.info_outline,
                                size: 4.h,
                              ),
                              label: Text(
                                'About NU',
                                style: GoogleFonts.montserrat(
                                    textStyle: btnStyle,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Container(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Scholarship()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                primary: HexColor('af9f30'),
                                elevation: 5,
                                // padding: EdgeInsets.symmetric(
                                //     vertical: 2.h, horizontal: 7.w),
                              ),
                              icon: Icon(
                                Icons.school,
                                size: 4.h,
                              ),
                              label: Text(
                                'Scholarship',
                                style: GoogleFonts.montserrat(
                                    textStyle: btnStyle,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Container(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Admission()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                primary: HexColor('af9f30'),
                                elevation: 5,
                                // padding: EdgeInsets.symmetric(
                                //     vertical: 2.h, horizontal: 7.w),
                              ),
                              icon: Icon(
                                Icons.perm_contact_cal,
                                size: 4.h,
                              ),
                              label: Text(
                                'Admission',
                                style: GoogleFonts.montserrat(
                                    textStyle: btnStyle,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Container(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => contactUs()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                primary: HexColor('af9f30'),
                                elevation: 5,
                                // padding: EdgeInsets.symmetric(
                                //     vertical: 2.h, horizontal: 7.w),
                              ),
                              icon: Icon(
                                Icons.call,
                                size: 4.h,
                              ),
                              label: Text(
                                'Contact Us',
                                style: GoogleFonts.montserrat(
                                    textStyle: btnStyle,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 65.h,
                      width: 80.w,
                      margin: EdgeInsets.only(left: 10.w, top: 15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 1.sp, top: 1.sp, bottom: 1.sp),
                            padding: EdgeInsets.all(2.sp),
                            color: Colors.white,
                            height: 59.h,
                            width: 20.w,
                            child: SingleChildScrollView(
                                child: Column(
                              children: [
                                SizedBox(
                                  height: 8.h,
                                  width: 24.w,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                landingPage()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: HexColor('af9f30'),
                                        elevation: 5,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 1.w),
                                        textStyle: TextStyle(fontSize: 6.sp)),
                                    child: Text(
                                      'Brief History',
                                      style: GoogleFonts.montserrat(
                                          textStyle: btnStyle,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                SizedBox(
                                  height: 8.h,
                                  width: 24.w,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                landingPage()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: HexColor('af9f30'),
                                        elevation: 5,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 1.w),
                                        textStyle: TextStyle(fontSize: 6.sp)),
                                    child: Text(
                                      'Mission and Vision',
                                      style: GoogleFonts.montserrat(
                                          textStyle: btnStyle,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                SizedBox(
                                  height: 8.h,
                                  width: 24.w,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                landingPage()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: HexColor('af9f30'),
                                        elevation: 5,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 1.w),
                                        textStyle: TextStyle(fontSize: 6.sp)),
                                    child: Text(
                                      'Core Values',
                                      style: GoogleFonts.montserrat(
                                          textStyle: btnStyle,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                SizedBox(
                                  height: 8.h,
                                  width: 24.w,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                landingPage()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: HexColor('af9f30'),
                                        elevation: 5,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 1.w),
                                        textStyle: TextStyle(fontSize: 6.sp)),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Gain',
                                          style: GoogleFonts.montserrat(
                                              textStyle: btnStyle,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                SizedBox(
                                  height: 8.h,
                                  width: 24.w,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                landingPage()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: HexColor('af9f30'),
                                        elevation: 5,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 1.w),
                                        textStyle: TextStyle(fontSize: 6.sp)),
                                    child: Text(
                                      'QuaWORlity Policy',
                                      style: GoogleFonts.montserrat(
                                          textStyle: btnStyle,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ),
                          Container(
                            height: 75.h,
                            width: .5.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: HexColor('af9f30')),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Title Here',
                                  style: GoogleFonts.montserrat(
                                      textStyle: textTitleStyle,
                                      fontWeight: FontWeight.w500),
                                ),
                                margin: EdgeInsets.only(left: 1.w),
                              ),
                              Container(
                                height: 1.h,
                                width: 59.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: HexColor('af9f30')),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 1.sp, bottom: 1.sp, right: 1.sp),
                                height: 50.h,
                                width: 57.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.all(3.sp),
                                  child: Text(
                                    '''University Location
The University can easily be reached from any part of the City of Manila by using the ordinary means of transportation.

From Quiapo, one may take jeepney plying the Quiapo Lealtad route at Barbosa Street in Quiapo and then alight at a point on F. Jhocson: if preferred, one may take Balic-Balic bound jeepney and alight at the corner of G. Tuazon and M. F. Jhocson Streets.

The University may also be reached by way of Espana Street from points North or Northwest through Cayco Street, then turn right through F. Jhocson Street to M. F. Jhocson Street; from points Northwest through Earnshaw Street, turn left through Cayco then right through F. Jhocson to M. F. Jhocson.

From Antipolo, Cainta, Marikina, Pasig and surrounding communities, the University can be reached by taking the LRT Marikina Santolan Station and alight at the Legarda Station, then proceed towards the Sampaloc church, turn right to F. Jhocson Street.''',
                                    style: GoogleFonts.montserrat(
                                        textStyle: contentStyle,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                width: 100.w,
              ),
            ],
          ),
        ));
  }
}
