import 'package:abigail_askbilly/Classes/Building.dart';
import 'package:abigail_askbilly/Classes/Facility.dart';
import 'package:abigail_askbilly/LoadingPage/Loadingpage.dart';
import 'package:abigail_askbilly/Maps/BuildingFacility.dart';
import 'package:abigail_askbilly/Maps/MapService.dart';
import 'package:abigail_askbilly/Maps/Mapshome.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import '../Classes/Floor.dart';
import '../MenuBar.dart';

class mainBuilding extends StatefulWidget {
  final String buildingName;

  mainBuilding({required this.buildingName});

  @override
  State<mainBuilding> createState() => _mainBuildingState();
}

class _mainBuildingState extends State<mainBuilding> {
  var size, height, width;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final titleStyle = TextStyle(fontSize: 6.h, color: HexColor('061e47'));
  final btnStyle = TextStyle(fontSize: 3.h, color: Colors.white);

  late Future<Building> futureBuilding;
  String highlightedFloor = '';
  List<Facility> visibleFacilities = [];

  @override
  void initState() {
    super.initState();

    futureBuilding = getBuilding(widget.buildingName);
  }

  Future<Building> getBuilding(String buildingName) async {
    Response response;
    response = await MapService().getBuilding(buildingName);
    //print(response.data);
    //var building =
    // print(building.building_name);
    // print(building.image_path);
    //
    // for (var floor in building.floors) {
    //   print(floor.floor_number);
    //   for (var facility in floor.facilities) {
    //     print(facility.facility_name);
    //   }
    // }
    return Building.fromJSON(response.data);
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
                    Expanded(
                        child: Text(
                      widget.buildingName,
                      style: GoogleFonts.montserrat(
                          textStyle: titleStyle,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp),
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
                child: FutureBuilder(
                    future: futureBuilding,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Building building = snapshot.data as Building;

                        return Stack(
                          children: [
                            Container(
                              height: 100.h,
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              decoration: BoxDecoration(
                                color: HexColor('dee7f0'),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 10, left: 25),
                              child: Image.asset(
                                widget.buildingName == 'MAIN BUILDING'
                                    ? 'assets/MapsPage/MB.png'
                                    : widget.buildingName ==
                                            'JHOCSON MARIANO BUILDING'
                                        ? 'assets/MapsPage/JMB.png'
                                        : 'assets/MapsPage/AB.png',
                                width: width / 2,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 1.5.w, top: 1.h, bottom: 1.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(),
                                  Container(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: visibleFacilities
                                            .map((facility) =>
                                                _facilityButton(facility))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Container(
                                    child: SingleChildScrollView(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: building.floors
                                              .map((floor) =>
                                                  _floorButton(floor))
                                              .toList()),
                                    ),
                                  )
                                ],
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
                        );
                      } else {
                        return Image.asset(
                            'assets/DBLoading/Loading top font.gif');
                      }
                    }),
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

  Widget _floorButton(Floor floor) {
    return Container(
      width: 25.w,
      margin: EdgeInsets.symmetric(vertical: 0.25.h),
      child: ElevatedButton(
        onPressed: () {
          highlightedFloor = floor.floor_number;
          visibleFacilities.clear();
          for (var facility in floor.facilities) {
            visibleFacilities.add(facility);
          }
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          primary: highlightedFloor == floor.floor_number
              ? HexColor('061e47')
              : HexColor('af9f30'),
          elevation: 5,
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        ),
        child: Text(
          floor.floor_number,
          style: GoogleFonts.montserrat(
              textStyle: btnStyle,
              fontWeight: FontWeight.w500,
              fontSize: 10.sp),
        ),
      ),
    );
  }

  Widget _facilityButton(Facility facility) {
    return Container(
      width: 33.w,
      margin: EdgeInsets.symmetric(vertical: 0.25.h),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BuildingFacility(
                      floor_number: highlightedFloor,
                      facility: facility,
                    )),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: HexColor('af9f30'),
          elevation: 5,
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
          textStyle: TextStyle(
            fontSize: facility.facility_name.length > 10 ? 4.sp : 5.sp,
          ),
        ),
        child: Text(
          facility.facility_name,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              textStyle: btnStyle,
              fontWeight: FontWeight.w500,
              fontSize: 10.sp),
        ),
      ),
    );
  }
}
