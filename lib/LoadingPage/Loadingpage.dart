import 'dart:async';
import 'package:abigail_askbilly/HomePage/Homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 14),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => homePage())));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(237, 244, 252, 1),
                  Color.fromRGBO(200, 217, 243, 1)
                ]),
            image: DecorationImage(
                opacity: .1,
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.contain)),
        height: 100.h,
        width: width,
        child: Row(
          children: [
            Container(
              // color: Colors.red,
              width: width / 3,
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                'assets/LoadingPage/walking-billy.gif',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: width / 3,
              // color: Colors.blue,
              child: Image.asset(
                'assets/LoadingPage/welcome-font.gif',
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
    );
  }
}
