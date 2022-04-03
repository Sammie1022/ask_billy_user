import 'package:abigail_askbilly/HomePage/Homepage.dart';
import 'package:abigail_askbilly/Maps/BuildingItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../LoadingPage/LoadPage.dart';
import '../LoadingPage/Loadingpage.dart';
import '../MenuBar.dart';

class landingPage extends StatefulWidget {
  const landingPage({Key? key}) : super(key: key);

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  final titleStyle = TextStyle(fontSize: 14.h, color: Colors.white);
  final textStyle = TextStyle(fontSize: 3.h, color: Colors.white);
  final btnStyle = TextStyle(fontSize: 4.h, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              width: width / 2.3,
              color: HexColor('061e47'),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 33.w),
                      child: Text(
                        'Ask Billy',
                        style: GoogleFonts.montserrat(
                            textStyle: titleStyle,
                            fontWeight: FontWeight.bold,
                            fontSize: 4.5.h),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 4.w),
                      child: Text(
                        'An Information Kiosk for National University-Manila',
                        style: GoogleFonts.montserrat(
                            textStyle: textStyle,
                            fontWeight: FontWeight.normal,
                            fontSize: 2.h),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          //margin: EdgeInsets.only(bottom: 5.h),
                          child: Image.asset(
                            'assets/Paws.png',
                            width: 10.w,
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          // margin: EdgeInsets.only(
                          //     bottom: 5.h, right: 36.w, top: 25.h),
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
                              'PUSH',
                              style: GoogleFonts.montserrat(
                                  textStyle: btnStyle,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 2.5.h),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
