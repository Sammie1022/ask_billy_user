import 'package:abigail_askbilly/About/Abouthome.dart';
import 'package:abigail_askbilly/Faqs/Faqshome.dart';
import 'package:abigail_askbilly/Maps/Mapshome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:abigail_askbilly/LoadingPage/Loadingpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final titleStyle = TextStyle(fontSize: 6.h, color: HexColor('061e47'));
  final btnStyle = TextStyle(fontSize: 4.h, color: Colors.white);
  var size, height, width;
  // TODO 4: Create a VideoPlayerController object.
  late VideoPlayerController _controller;

  //TODO 5: Override the initState() method and setup your VideoPlayerController
  @override
  void initState() {
    super.initState();
    //Pointing the video controller to our local asset.
    _controller =
        VideoPlayerController.asset('assets/HomePage/sample-video.mp4');
    _controller.addListener(() {});
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    //Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]); //landscape orientation

    return Scaffold(
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
                Expanded(
                    child: Container(
                  child: Text(
                    'Ask Billy',
                    style: GoogleFonts.montserrat(
                        textStyle: titleStyle,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp),
                  ),
                  margin: EdgeInsets.only(left: 3.w),
                )),
                Image.asset(
                  'assets/logo.png',
                  height: 7.h,
                ),
              ],
            ),
          ),
          Container(
            color: HexColor('af9f30'),
            height: 2.h,
            width: width,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: HexColor('dee7f0'),
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  // TODO: Add a SizedBox to contain our video.
                  Container(
                    child: FittedBox(
                      // If your background video doesn't look right, try changing the BoxFit property.
                      // BoxFit.fill created the look I was going for.
                      fit: BoxFit.fitWidth,
                      child: SizedBox(
                        width: width / 2,
                        height: height / 2,
                        child: Container(child: VideoPlayer(_controller)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _controller.dispose();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => faqsHome()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 5.w, right: 5.w),
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: HexColor('af9f30'),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.question_answer_outlined,
                                      size: 13.sp,
                                      color: Colors.white,
                                    ),
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(50.0),
                                    //   color: HexColor('230871'),
                                    // ),
                                    padding: EdgeInsets.all(.5.w),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    'FAQs',
                                    style: GoogleFonts.montserrat(
                                        textStyle: btnStyle,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp),
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _controller.dispose();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => mapsHome()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 5.w, right: 5.w),
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: HexColor('af9f30'),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.map,
                                      size: 13.sp,
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.all(.5.w),
                                  ),
                                  SizedBox(
                                    width: 3.5.w,
                                  ),
                                  Text(
                                    'MAPS',
                                    style: GoogleFonts.montserrat(
                                        textStyle: btnStyle,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp),
                                  ),
                                  SizedBox(
                                    width: 5.5.w,
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _controller.dispose();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => aboutHome()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 5.w, right: 5.w),
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: HexColor('af9f30'),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.info_outline,
                                      size: 13.sp,
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.all(.5.w),
                                  ),
                                  SizedBox(
                                    width: 1.5.w,
                                  ),
                                  Text('ABOUT NU',
                                      style: GoogleFonts.montserrat(
                                          textStyle: btnStyle,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.sp)),
                                  SizedBox(
                                    width: 2.5.w,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
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

  // TODO: Override the dipose() method to cleanup the video controller.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
