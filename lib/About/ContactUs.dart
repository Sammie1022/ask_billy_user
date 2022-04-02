import 'package:abigail_askbilly/About/Abouthome.dart';
import 'package:abigail_askbilly/About/Admission.dart';
import 'package:abigail_askbilly/About/Scholarship.dart';
import 'package:abigail_askbilly/Maps/Mapshome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../MenuBar.dart';

class contactUs extends StatefulWidget {
  @override
  State<contactUs> createState() => _contactUsState();
}

class _contactUsState extends State<contactUs> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final titleStyle = TextStyle(fontSize: 6.h, color: HexColor('061e47'));
  final btnStyle = TextStyle(fontSize: 3.h, color: Colors.white);
  final textTitleStyle = TextStyle(fontSize: 7.h, color: HexColor('061e47'));
  Set<Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(14.604046, 120.994903),
          infoWindow: InfoWindow(
              title: 'National University-Manila',
              snippet: 'Pamantasang Pambansa'),
        ),
      );
    });
  }

  var size, height, width;
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
                                  primary: HexColor('af9f30'),
                                  elevation: 5,
                                  // padding: EdgeInsets.symmetric(
                                  //     vertical: 2.h, horizontal: 7.w),
                                  textStyle: TextStyle(
                                    fontSize: 6.sp,
                                    color: Colors.white,
                                  )),
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
                                  textStyle: TextStyle(
                                    fontSize: 6.sp,
                                    color: Colors.white,
                                  )),
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
                                  textStyle: TextStyle(
                                    fontSize: 6.sp,
                                    color: Colors.white,
                                  )),
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
                                  primary: HexColor('061e47'),
                                  elevation: 5,
                                  // padding: EdgeInsets.symmetric(
                                  //     vertical: 2.h, horizontal: 7.w),
                                  textStyle: TextStyle(
                                    fontSize: 6.sp,
                                    color: Colors.white,
                                  )),
                              icon: Icon(
                                Icons.call,
                                size: 4.h,
                              ),
                              label: Text(
                                'Contact Us',
                                style: GoogleFonts.montserrat(
                                    textStyle: btnStyle,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5.sp, top: 26.sp),
                          height: 63.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: HexColor('230871'),
                              width: 0.4.w,
                            ),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.all(3.sp),
                            child: Column(
                              children: [
                                Container(
                                  child: GoogleMap(
                                    onMapCreated: _onMapCreated,
                                    markers: _markers,
                                    initialCameraPosition: CameraPosition(
                                        target: LatLng(14.604046, 120.994903),
                                        zoom: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
