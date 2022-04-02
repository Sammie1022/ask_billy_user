import 'package:abigail_askbilly/About/Abouthome.dart';
import 'package:abigail_askbilly/Faqs/AnswerPage.dart';
import 'package:abigail_askbilly/Faqs/Faqshome.dart';
import 'package:abigail_askbilly/HomePage/Homepage.dart';
import 'package:abigail_askbilly/LandingPage/Landingpage.dart';
import 'package:abigail_askbilly/LoadingPage/Loadingpage.dart';
import 'package:abigail_askbilly/loginscreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'Maps/BuildingFacility.dart';
import 'Maps/Mapshome.dart';
import 'Maps/mainBuilding.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  // var size, height, width;
  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    // size = MediaQuery.of(context).size;
    // height = size.height;
    // width = size.width;
    //Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]); //landscape orientation
    return Sizer(
      builder: (context, orientaion, deviceType) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          home: faqsHome(),
        );
      },
    );
  }
}
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations(
//         [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
//     return MaterialApp(
//       // title: 'Flutter Demo',
//       // theme: ThemeData(
//       //   scaffoldBackgroundColor: const Color.fromRGBO(6, 30, 71, 1),
//       //   primarySwatch: Colors.blue,
//       // ),
//       home: Sizer(
//         builder: (((context, orientation, deviceType) {
//           return landingPage();
//         })),
//       ),
//     );
//   }
// }
