import 'package:abigail_askbilly/Classes/OfficeButton.dart';
import 'package:abigail_askbilly/Faqs/FaqService.dart';
import 'package:abigail_askbilly/Faqs/OfficeItem.dart';
import 'package:abigail_askbilly/HomePage/Homepage.dart';
import 'package:abigail_askbilly/MenuBar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../Classes/Faq.dart';

class faqsHome extends StatefulWidget {
  @override
  State<faqsHome> createState() => _faqsHomeState();
}

class _faqsHomeState extends State<faqsHome> {
  var size, height, width;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final titleStyle = TextStyle(fontSize: 6.h, color: HexColor('061e47'));
  List<OfficeButton> offices = [
    OfficeButton(
        buttonPath: 'assets/FAQsPage/images/buttons/AO-btn.png',
        officeName: 'ADMISSIONS OFFICE'),
    OfficeButton(
        buttonPath: 'assets/FAQsPage/images/buttons/SDAO-btn.png',
        officeName: 'STUDENT DEVELOPMENT & ACTIVITIES OFFICE'),
    OfficeButton(
        buttonPath: 'assets/FAQsPage/images/buttons/GSO-btn.png',
        officeName: 'GUIDANCE SERVICES OFFICE'),
    OfficeButton(
        buttonPath: 'assets/FAQsPage/images/buttons/HEALTH-btn.png',
        officeName: 'HEALTH SERVICES OFFICE'),
    OfficeButton(
        buttonPath: 'assets/FAQsPage/images/buttons/ITRO-btn.png',
        officeName: 'INFORMATION TECHNOLOGY RESOURCE OFFICE'),
    OfficeButton(
        buttonPath: 'assets/FAQsPage/images/buttons/LRC-btn.png',
        officeName: 'LEARNING RESOURCE CENTER'),
  ];
  late Future<List<Faq>> _getOffices;
  List _faqsList = [];
  @override
  void initState() {
    super.initState();
    _getOffices = getOffices();
  }

  Future<List<Faq>> getOffices() async {
    Response response;
    response = await FaqService().getOffices();

    List<Faq> faqList = [];
    var office = response.data['value'];

    for (var offices in office) {
      faqList.add(Faq.fromJSON(offices));
      print(offices);
    }
    print(faqList.map((e) => e.image_path));

    setState(() {
      _faqsList = faqList;
    });

    print(faqList.asMap());

    return faqList;
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
                      'OFFICES',
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
                child: Stack(
                  children: [
                    Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: HexColor('dee7f0'),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5.w),
                      child: FutureBuilder<List<Faq>>(
                        future: _getOffices,
                        builder: (BuildContext context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return Image.asset(
                                  'assets/DBLoading/Loading top font.gif');
                            default:
                              print('-------------------------');

                              if (snapshot.hasData) {
                                print("pasok");
                                print(snapshot.data!.asMap());

                                return GridView.count(
                                    mainAxisSpacing: 20.sp,
                                    crossAxisCount: 4,
                                    children: snapshot.data!
                                        .map((office) => OfficeItem(
                                              officeName: office.office_name,
                                              buttonPath: office.image_path,
                                            ))
                                        .toList());
                              } else {
                                return Image.asset(
                                    'assets/DBLoading/Loading top font.gif');
                              }
                          }
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(bottom: 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => homePage()),
                          );
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
                width: width,
              ),
            ],
          ),
        ));
  }
}
