import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'Maps/Mapshome.dart';
import 'MenuBar.dart';

class tryMenu extends StatefulWidget {
  const tryMenu({Key? key}) : super(key: key);

  @override
  _tryMenuState createState() => _tryMenuState();
}

class _tryMenuState extends State<tryMenu> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: menuBar(),
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
                image: DecorationImage(
                  image: AssetImage('assets/paws.gif'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.menu_rounded,
                      size: 10.h,
                    ),
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  // IconButton(
                  //   iconSize: 8.h,
                  //   color: Colors.black,
                  //   icon: Icon(
                  //     Icons.menu_rounded,
                  //     //size: 10.h,
                  //   ),
                  //   onPressed: () {
                  //     _scaffoldKey.currentState?.openDrawer();
                  //   },
                  // ),
                  // SizedBox(
                  //   width: 1.w,
                  // ),
                  // Expanded(
                  //   child: Text(
                  //     'ADMISSIONS OFFICE',
                  //     style: TextStyle(fontSize: 10.sp, fontFamily: 'Arial'),
                  //   ),
                  // ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2nd Floor Main Building',
                          style: TextStyle(
                              fontSize:
                                  SizerUtil.deviceType == DeviceType.mobile
                                      ? 1
                                      : 4.sp,
                              color: HexColor('30408d'))),
                      Text('8:00 am - 5:00 pm',
                          style: TextStyle(
                              fontSize:
                                  SizerUtil.deviceType == DeviceType.tablet
                                      ? 1
                                      : 4.sp,
                              color: HexColor('30408d'))),
                      Text('admissions@national-u.ed.ph',
                          style: TextStyle(
                            fontSize: SizerUtil.deviceType == DeviceType.tablet
                                ? 1
                                : 4.sp,
                            color: SizerUtil.deviceType == DeviceType.tablet
                                ? Colors.red
                                : Colors.amber,
                          )),
                    ],
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(right: 10.sp),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text('2nd Floor Main Building',
                  //           style: TextStyle(
                  //               fontSize: 4.sp, color: HexColor('30408d'))),
                  //       Text('8:00 am - 5:00 pm',
                  //           style: TextStyle(
                  //               fontSize: 4.sp, color: HexColor('30408d'))),
                  //       Text('admissions@national-u.ed.ph',
                  //           style: TextStyle(
                  //               fontSize: 4.sp, color: HexColor('30408d'))),
                  //     ],
                  //   ),
                  // ),
                  Image.asset('assets/logo.png'),
                ],
              ),
            ), //TOPBAR
            Container(
              color: HexColor('f8d00e'),
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
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [HexColor('edf4fc'), HexColor('c8d9f3')])),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(
                      right: 10.sp,
                    ),
                    // padding: EdgeInsets.only(right: 10.sp, bottom: 10.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 0.2.h,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(bottom: 5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => mapsHome()),
                        );
                      },
                      child: Image.asset(
                        'assets/back-btn.png',
                        height: 7.h,
                        width: 7.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: HexColor('30408d'),
              height: 2.h,
              width: 100.w,
            ),
          ],
        ),
      ),
    );
  }
}
