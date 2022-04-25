import 'package:abigail_askbilly/Classes/Building.dart';
import 'package:abigail_askbilly/Faqs/Faqshome.dart';
import 'package:abigail_askbilly/HomePage/Homepage.dart';
import 'package:abigail_askbilly/Maps/Mapshome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import '../Classes/Facility.dart';
import '../MenuBar.dart';
import 'mainBuilding.dart';

class BuildingFacility extends StatefulWidget {
  final String floor_number;
  final Facility facility;

  const BuildingFacility({required this.floor_number, required this.facility});

  @override
  State<BuildingFacility> createState() => _BuildingFacilityState();
}

class _BuildingFacilityState extends State<BuildingFacility> {
  var size, height, width;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final titleStyle = TextStyle(color: HexColor('061e47'));
  final styleText = TextStyle(color: Colors.white);
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  String guidePath = '';
  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    guidePath = widget.facility.facility_path_guide;
    if (guidePath.isNotEmpty) {
      _controller = VideoPlayerController.network(
        guidePath,
      );
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.play();
      _controller.setLooping(true);
    }
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
                    Container(
                        padding: EdgeInsets.all(0.5.sp),
                        child: Text(
                          widget.floor_number,
                          style: GoogleFonts.montserrat(
                              textStyle: titleStyle,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 1.w, right: 1.w),
                      height: 5.h,
                      width: .4.w,
                      color: HexColor('061e47'),
                    ),
                    Container(
                        padding: EdgeInsets.all(0.5.sp),
                        child: Text(
                          widget.facility.facility_name,
                          style: GoogleFonts.montserrat(
                              textStyle: titleStyle,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        )),
                    Expanded(
                      child: Container(),
                    ),
                    Image.asset('assets/logo.png', height: 7.h),
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
                    Positioned.fill(
                      child: Container(
                        color: HexColor('dee7f0'),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 14.w, top: 4.h, bottom: 4.h, right: 14.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white),
                        height: 75.h,
                        width: width / 1.3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Stack(children: [
                                FutureBuilder(
                                  future: _initializeVideoPlayerFuture,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      // If the VideoPlayerController has finished initialization, use
                                      // the data it provides to limit the aspect ratio of the video.
                                      return AspectRatio(
                                        aspectRatio:
                                            _controller.value.aspectRatio,
                                        // Use the VideoPlayer widget to display the video.
                                        child: VideoPlayer(_controller),
                                      );
                                    } else {
                                      // If the VideoPlayerController is still initializing, show a
                                      // loading spinner.
                                      return Image.asset(
                                          'assets/DBLoading/Loading top font.gif');
                                    }
                                  },
                                )
                                // Image.network(
                                //   widget.facility.facility_path_guide,
                                //   loadingBuilder:
                                //       (context, child, loadingProgress) {
                                //     if (loadingProgress == null) return child;
                                //     return Image.asset(
                                //         'assets/DBLoading/Loading top font.gif');
                                //   },
                                //   width: 80.w,
                                //   fit: BoxFit.contain,
                                // ),
                              ]),
                            ),
                            Container(
                              height: 75.h,
                              width: .5.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: HexColor('af9f30')),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      //color: Colors.red,
                                      height: 15.h,
                                      width: 60.w,
                                      alignment: Alignment.center,
                                      //margin: EdgeInsets.only(left: 2.sp),

                                      child: Image.network(
                                        widget.facility.facility_image_path,
                                        width: 67.w,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: .3.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: HexColor('af9f30')),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 15.h,
                                      width: 32.5.w,
                                      alignment: Alignment.center,
                                      // margin: EdgeInsets.only(left: 2.sp),
                                      padding: EdgeInsets.all(2.sp),

                                      child: Text(
                                        widget.facility.facility_description,
                                        style: GoogleFonts.montserrat(
                                            textStyle: styleText,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 9.sp,
                                            color: HexColor('061e47')),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                height: 1.5.h,
                width: width,
              ),
            ],
          ),
        ));
  }
}
