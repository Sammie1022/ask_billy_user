import 'package:abigail_askbilly/About/AboutAPI.dart';
import 'package:abigail_askbilly/Classes/SubCategory.dart';
import 'package:abigail_askbilly/HomePage/Homepage.dart';
import 'package:abigail_askbilly/LoadingPage/Loadingpage.dart';
import 'package:abigail_askbilly/Maps/Mapshome.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../Classes/About.dart';
import '../LandingPage/Landingpage.dart';
import '../MenuBar.dart';

class aboutHome extends StatefulWidget {
  @override
  State<aboutHome> createState() => _aboutHomeState();
}

class _aboutHomeState extends State<aboutHome> {
  var size, height, width;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final titleStyle = TextStyle(fontSize: 6.h, color: HexColor('061e47'));
  final btnStyle = TextStyle(
      fontSize: 3.h, color: Colors.white, overflow: TextOverflow.fade);
  final textTitleStyle = TextStyle(fontSize: 7.h, color: HexColor('061e47'));
  final contentStyle = TextStyle(fontSize: 3.h, color: HexColor('061e47'));

  String changeColor = "About NU";

  late Future<List<About>> futureAbout;
  String highlightedCategory = '';
  List<About> menuButtons = [];
  List<SubCategory> subList = [];
  String currentTitle = '';
  String currentDescription = '';
  String currentCategory = '';

  @override
  void initState() {
    super.initState();
    futureAbout = getAbout();
  }

  Future<List<About>> getAbout() async {
    Response response;
    response = await AboutAPI().getCategories();
    List<About> aboutList = [];
    var abouts = response.data['value'];
    for (var about in abouts) {
      aboutList.add(About.fromJSON(about));
    }

    setState(() {
      currentCategory = aboutList[0].category;
      menuButtons = aboutList;
      subList = aboutList[0].subcategories;
      currentTitle = subList[0].subcategory;
      currentDescription = subList[0].description;
    });
    return aboutList;
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
          color: HexColor('dee7f0'),
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
                    Text(
                      'About NU',
                      style: GoogleFonts.montserrat(
                          textStyle: titleStyle,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp),
                    ),
                    Image.asset(
                      'assets/logo.png',
                      height: 7.h,
                    ),
                  ],
                ),
              ), //TOPBAR

              Container(
                color: HexColor('af9f30'),
                height: 2.h,
                width: width,
              ),
              Expanded(
                child: Container(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        top: 0.0,
                        left: 0.0,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 15.w, right: 15.w, bottom: 5.h, top: 4.h),
                          color: HexColor('dee7f0'),
                          // color: Colors.blueGrey,
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            changeColor = "About NU";
                                          });
                                          int i = 0;
                                          int index = 0;
                                          int flag = 0;
                                          while (flag != 1) {
                                            if (menuButtons[index].category ==
                                                "About NU") {
                                              i = index;
                                              flag = 1;
                                            } else {
                                              index++;
                                            }
                                          }
                                          setState(() {
                                            currentCategory =
                                                menuButtons[i].category;
                                            currentTitle = menuButtons[i]
                                                .subcategories[0]
                                                .subcategory;
                                            currentDescription = menuButtons[i]
                                                .subcategories[0]
                                                .description;
                                            subList =
                                                menuButtons[i].subcategories;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          // primary: HexColor('af9f30'),
                                          primary: changeColor == "About NU"
                                              ? HexColor('061e47')
                                              : HexColor('af9f30'),
                                          elevation: 5,
                                          // padding: EdgeInsets.symmetric(
                                          //     vertical: 2.h, horizontal: 7.w),
                                        ),
                                        icon: Icon(
                                          Icons.info_outline,
                                          size: 4.h,
                                        ),
                                        label: Text(
                                          'About NU',
                                          style: GoogleFonts.montserrat(
                                              textStyle: btnStyle,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.5.w,
                                    ),
                                    Container(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            changeColor = "Scholarship";
                                          });
                                          int i = 0;
                                          int index = 0;
                                          int flag = 0;
                                          while (flag != 1) {
                                            if (menuButtons[index].category ==
                                                "Scholarship") {
                                              i = index;
                                              flag = 1;
                                            } else {
                                              index++;
                                            }
                                          }
                                          setState(() {
                                            currentCategory =
                                                menuButtons[i].category;
                                            currentTitle = menuButtons[i]
                                                .subcategories[0]
                                                .subcategory;
                                            currentDescription = menuButtons[i]
                                                .subcategories[0]
                                                .description;
                                            subList =
                                                menuButtons[i].subcategories;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          primary: changeColor == "Scholarship"
                                              ? HexColor('061e47')
                                              : HexColor('af9f30'),
                                          elevation: 5,
                                          // padding: EdgeInsets.symmetric(
                                          //     vertical: 2.h, horizontal: 7.w),
                                        ),
                                        icon: Icon(
                                          Icons.school,
                                          size: 4.h,
                                        ),
                                        label: Text(
                                          'Scholarship',
                                          style: GoogleFonts.montserrat(
                                              textStyle: btnStyle,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.5.w,
                                    ),
                                    Container(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            changeColor = "Admission";
                                          });
                                          int i = 0;
                                          int index = 0;
                                          int flag = 0;
                                          while (flag != 1) {
                                            if (menuButtons[index].category ==
                                                "Admissions") {
                                              i = index;
                                              flag = 1;
                                            } else {
                                              index++;
                                            }
                                          }
                                          setState(() {
                                            currentCategory =
                                                menuButtons[i].category;
                                            currentTitle = menuButtons[i]
                                                .subcategories[0]
                                                .subcategory;
                                            currentDescription = menuButtons[i]
                                                .subcategories[0]
                                                .description;
                                            subList =
                                                menuButtons[i].subcategories;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          primary: changeColor == "Admission"
                                              ? HexColor('061e47')
                                              : HexColor('af9f30'),
                                          // HexColor('af9f30')
                                          elevation: 5,
                                          // padding: EdgeInsets.symmetric(
                                          //     vertical: 2.h, horizontal: 7.w),
                                        ),
                                        icon: Icon(
                                          Icons.perm_contact_cal,
                                          size: 4.h,
                                        ),
                                        label: Text(
                                          'Admission',
                                          style: GoogleFonts.montserrat(
                                              textStyle: btnStyle,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.5.w,
                                    ),
                                    Container(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            changeColor = "Contact Us";
                                          });
                                          int i = 0;
                                          int index = 0;
                                          int flag = 0;
                                          while (flag != 1) {
                                            if (menuButtons[index].category ==
                                                "Contact Us") {
                                              i = index;
                                              flag = 1;
                                            } else {
                                              index++;
                                            }
                                          }
                                          setState(() {
                                            currentCategory =
                                                menuButtons[i].category;
                                            currentTitle = menuButtons[i]
                                                .subcategories[0]
                                                .subcategory;
                                            currentDescription = menuButtons[i]
                                                .subcategories[0]
                                                .description;
                                            subList =
                                                menuButtons[i].subcategories;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          primary: changeColor == "Contact Us"
                                              ? HexColor('061e47')
                                              : HexColor('af9f30'),
                                          elevation: 5,
                                          // padding: EdgeInsets.symmetric(
                                          //     vertical: 2.h, horizontal: 7.w),
                                        ),
                                        icon: Icon(
                                          Icons.call,
                                          size: 4.h,
                                        ),
                                        label: Text(
                                          'Contact Us',
                                          style: GoogleFonts.montserrat(
                                              textStyle: btnStyle,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10.sp),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.only(bottom: 2.5.h),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          child: ListView.separated(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w),
                                            itemCount: subList.length,
                                            shrinkWrap: true,

                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                height: 0.025.h,
                                              );
                                            },
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    currentTitle =
                                                        subList[index]
                                                            .subcategory;
                                                    currentDescription =
                                                        subList[index]
                                                            .description;
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: currentTitle ==
                                                            subList[index]
                                                                .subcategory
                                                        ? HexColor('061e47')
                                                        : HexColor('af9f30'),
                                                    elevation: 5,
                                                    textStyle: TextStyle(
                                                      fontSize: 6.sp,
                                                    )),
                                                child: Container(
                                                  width: double.infinity,
                                                  child: Text(
                                                    subList[index].subcategory,
                                                    textAlign: TextAlign.left,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      textStyle: btnStyle,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10.sp,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }, // use it
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: .5.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: HexColor('af9f30')),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.5.h),
                                              child: Text(
                                                currentTitle,
                                                style: GoogleFonts.montserrat(
                                                    textStyle: textTitleStyle,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 17.sp),
                                              ),
                                              margin:
                                                  EdgeInsets.only(left: 1.w),
                                            ),
                                            Container(
                                              height: .3.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  color: HexColor('af9f30')),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  padding: EdgeInsets.all(5.sp),
                                                  child: Text(
                                                    currentDescription,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            textStyle:
                                                                contentStyle,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 9.sp),
                                                  ),
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
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        left: 10.0,
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
}
