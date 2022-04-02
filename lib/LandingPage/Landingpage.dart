import 'package:abigail_askbilly/HomePage/Homepage.dart';
import 'package:abigail_askbilly/Maps/BuildingItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../LoadingPage/Loadingpage.dart';
import '../MenuBar.dart';

class landingPage extends StatefulWidget {
  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final titleStyle = TextStyle(fontSize: 14.h, color: Colors.white);
  final textStyle = TextStyle(fontSize: 3.h, color: Colors.white);
  final btnStyle = TextStyle(fontSize: 4.h, color: Colors.white);

  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: menuBar(),
        body: Container(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 100.h,
                      width: 60.w,
                      color: HexColor('061e47'),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10.w),
                            child: Text(
                              'Ask Billy',
                              style: GoogleFonts.montserrat(
                                textStyle: titleStyle,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 4.w),
                            child: Text(
                              'An Information Kiosk for National University-Manila',
                              style: GoogleFonts.montserrat(
                                  textStyle: textStyle,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 18.w),
                            height: .4.h,
                            width: 22.w,
                            color: HexColor('af9f30'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 7.w),
                      child: Image.asset(
                        'assets/logo.png',
                        width: 25.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.h, left: 90.w),
                      height: 6.h,
                      width: 10.w,
                      color: HexColor('061e47'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 22.5.h, left: 85.w),
                      alignment: Alignment.center,
                      height: .4.h,
                      width: 12.w,
                      color: HexColor('af9f30'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 70.h, left: 50.w),
                      alignment: Alignment.center,
                      height: .4.h,
                      width: 18.w,
                      color: HexColor('af9f30'),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(bottom: 5.h),
                      child: Image.asset(
                        'assets/Paws.png',
                        width: 10.w,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: 15.h, right: 40.w),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loadingPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                          primary: HexColor('af9f30'),
                          elevation: 5,
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 7.w),
                        ),
                        child: Text(
                          'START',
                          style: GoogleFonts.montserrat(
                              textStyle: btnStyle, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
