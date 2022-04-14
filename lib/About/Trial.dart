import 'package:abigail_askbilly/Classes/About.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../LandingPage/Landingpage.dart';

class Trial extends StatefulWidget {
//  final About about;
  const Trial({Key? key}) : super(key: key);

  @override
  State<Trial> createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  var size, height, width;
  final titleStyle = TextStyle(fontSize: 6.h, color: HexColor('061e47'));
  final btnStyle = TextStyle(fontSize: 3.h, color: Colors.white);
  final textTitleStyle = TextStyle(fontSize: 7.h, color: HexColor('061e47'));
  final contentStyle = TextStyle(fontSize: 3.h, color: HexColor('061e47'));
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      height: 65.h,
      width: width / 1.3,
      margin: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 1.sp, top: 1.sp, bottom: 1.sp),
            padding: EdgeInsets.all(2.sp),
            color: Colors.white,
            height: 59.h,
            width: 38.w,
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  width: 30.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => landingPage()),
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
                          'Brief History',
                          style: GoogleFonts.montserrat(
                              textStyle: btnStyle,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: 30.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => landingPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: HexColor('af9f30'),
                      elevation: 5,
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                    ),
                    child: Text(
                      'Mission and Vision',
                      style: GoogleFonts.montserrat(
                          textStyle: btnStyle,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: 30.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => landingPage()),
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
                          'Core Values',
                          style: GoogleFonts.montserrat(
                              textStyle: btnStyle,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: 30.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => landingPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: HexColor('af9f30'),
                        elevation: 5,
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 1.w),
                        textStyle: TextStyle(fontSize: 6.sp)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gain',
                          style: GoogleFonts.montserrat(
                              textStyle: btnStyle,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: 30.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => landingPage()),
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
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp),
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
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                ),
                margin: EdgeInsets.only(left: 1.w),
              ),
              Container(
                height: .3.h,
                width: width / 1.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: HexColor('af9f30')),
              ),
              Container(
                margin: EdgeInsets.only(left: 1.sp, bottom: 1.sp, right: 1.sp),
                height: height / 2.7,
                width: width / 1.8,
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
                        fontWeight: FontWeight.normal,
                        fontSize: 9.sp),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
