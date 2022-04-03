import 'dart:async';
import 'package:abigail_askbilly/HomePage/Homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class loadingPage extends StatefulWidget {
  const loadingPage({Key? key}) : super(key: key);

  @override
  State<loadingPage> createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1000),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => homePage())));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: 100.h,
      width: 1300,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 58.1.h,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [HexColor('edf4fc'), HexColor('c8d9f3')])),
                  padding: EdgeInsets.symmetric(horizontal: 63.w),
                  child: Container(
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset('assets/logo.png',
                          width: 60.w, height: 60.h, fit: BoxFit.contain),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25.w),
                  child: Image.asset('assets/LoadingPage/welcome-font.gif',
                      width: 100.w, height: 100.h, fit: BoxFit.contain),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(bottom: 10),
                  child: Image.asset('assets/LoadingPage/walking-billy.gif',
                      width: 45.w, height: 45.h, fit: BoxFit.contain),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
