import 'package:abigail_askbilly/About/Abouthome.dart';
import 'package:abigail_askbilly/Faqs/Faqshome.dart';
import 'package:abigail_askbilly/HomePage/Homepage.dart';
import 'package:abigail_askbilly/Maps/Mapshome.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class menuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 10.w,
        child: Drawer(
          elevation: 0,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homePage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular((10.0)))),
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: Container(
                    width: 5.w,
                    height: 13.h,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: HexColor('af9f30'),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Icon(
                            Icons.home,
                            size: 7.h,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        Text(
                          'HOME',
                          style: TextStyle(fontSize: 3.sp, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mapsHome()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  color: Colors.white,
                  child: Container(
                    width: 5.w,
                    height: 13.h,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: HexColor('af9f30'),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 7.h,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        Text(
                          'MAPS',
                          style: TextStyle(fontSize: 3.sp, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => faqsHome()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  color: Colors.white,
                  child: Container(
                    width: 5.w,
                    height: 13.h,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: HexColor('af9f30'),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Icon(
                            Icons.question_answer_outlined,
                            size: 7.h,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        Text(
                          'FAQs',
                          style: TextStyle(fontSize: 3.sp, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => aboutHome()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular((10.0)))),
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: Container(
                    width: 5.w,
                    height: 13.h,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: HexColor('af9f30'),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Icon(
                            Icons.info_outline,
                            size: 7.h,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        Text(
                          'ABOUT NU',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 2.5.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
