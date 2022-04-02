//import 'package:abigail_askbilly/LandingPage/Landingpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(builder: (context, orientation, deviceType) {
//       SizerUtil.deviceType == DeviceType.mobile
//           ? Container(
//               // Widget for Mobile
//               width: 100.w,
//               height: 20.5.h,
//             )
//           : Container(
//               // Widget for Tablet
//               width: 100.w,
//               height: 12.5.h,
//             );
//       return MaterialApp(
//         home: landingPage(),
//       );
//     });
//   }
// }
//
// class landingPage extends StatefulWidget {
//   @override
//   _landingPageState createState() => _landingPageState();
// }
//
// class _landingPageState extends State<landingPage> {
//   // TODO 4: Create a VideoPlayerController object.
//   late VideoPlayerController _controller;
//
//   // TODO 5: Override the initState() method and setup your VideoPlayerController
//   @override
//   void initState() {
//     super.initState();
//     // Pointing the video controller to our local asset.
//     _controller = VideoPlayerController.asset(
//         'assets/LandingPage/video/landing-bg-video.mp4')
//       ..initialize().then((_) {
//         // Once the video has been loaded we play the video and set looping to true.
//         _controller.play();
//         _controller.setLooping(true);
//         // Ensure the first frame is shown after the video is initialized.
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //Set landscape orientation
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.landscapeRight,
//     ]); //landscape orientation
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           // TODO 6: Create a Stack Widget
//           body: Stack(
//             children: <Widget>[
//               // TODO 7: Add a SizedBox to contain our video.
//               SizedBox.expand(
//                 child: FittedBox(
//                   // If your background video doesn't look right, try changing the BoxFit property.
//                   // BoxFit.fill created the look I was going for.
//                   fit: BoxFit.fill,
//                   child: SizedBox(
//                     // width: _controller.value.size?.width ?? 0,
//                     // height: _controller.value.size?.height ?? 0,
//                     child: VideoPlayer(_controller),
//                   ),
//                 ),
//               ),
//               //Video Player
//               Positioned(
//                 // Logo
//                 top: 2.h,
//                 left: 30.h,
//                 child: Image(
//                   image: AssetImage('assets/LandingPage/images/logo.png'),
//                   height: 40.h,
//                   width: 40.h,
//                 ),
//               ), // Logo
//               SizedBox(
//                 height: 5.0,
//               ),
//               Positioned(
//                 //alignment: Alignment.bottomCenter,
//                 bottom: 10.0,
//                 left: 310.0,
//                 child: ElevatedButton(
//                   child: Text(
//                     'Start',
//                     style: TextStyle(fontSize: 25.0),
//                   ),
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                         (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.pressed))
//                             return Colors.amber;
//                           return Colors.blue; // Use the component's default.
//                         },
//                       ),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                       ))),
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //       builder: (context) => const loadingPage()),
//                     // );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // TODO 8: Override the dipose() method to cleanup the video controller.
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
