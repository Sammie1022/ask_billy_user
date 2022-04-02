import 'package:abigail_askbilly/HomePage/Homepage.dart';
import 'package:abigail_askbilly/Maps/BuildingItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../MenuBar.dart';

import 'mainBuilding.dart';

class mapsHome extends StatefulWidget {
  @override
  State<mapsHome> createState() => _mapsHomeState();
}

class _mapsHomeState extends State<mapsHome> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final titleStyle = TextStyle(fontSize: 6.h, color: HexColor('061e47'));

  List<String> buildings = [
    'MAIN BUILDING',
    'JHOCSON MARIANO BUILDING',
    'ANNEX BUILDING'
  ];

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
                    Expanded(
                        child: Text(
                      'MAPS',
                      style: GoogleFonts.montserrat(
                          textStyle: titleStyle, fontWeight: FontWeight.bold),
                    )),
                    Image.asset('assets/logo.png'),
                  ],
                ),
              ),
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
                      decoration: BoxDecoration(
                        color: HexColor('dee7f0'),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 9.w),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Image.asset(
                          'assets/MapsPage/NU-building.png',
                          width: 85.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: 5, left: 8.w, right: 8.w),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: buildings
                              .map((building) =>
                                  BuildingItem(buildingName: building))
                              .toList()),
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
                          height: 9.h,
                          width: 9.w,
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
