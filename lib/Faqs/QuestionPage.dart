import 'dart:convert';

import 'package:abigail_askbilly/Classes/Faq.dart';
import 'package:abigail_askbilly/Classes/Office.dart';
import 'package:abigail_askbilly/Classes/Question.dart';
import 'package:abigail_askbilly/Faqs/FaqService.dart';
import 'package:abigail_askbilly/Faqs/Faqshome.dart';
import 'package:abigail_askbilly/Faqs/QuestionItem.dart';
import 'package:abigail_askbilly/MenuBar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class QuestionPage extends StatefulWidget {
  final String officeName;

  QuestionPage({required this.officeName});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final titleStyle = TextStyle(fontSize: 6.h, color: HexColor('061e47'));
  final styleText = TextStyle(fontSize: 2.2.h, color: HexColor('061e47'));

  String office_name = '';
  String location = '';
  String office_hours = '';
  String office_email = '';
  List questions = [];
  // Office officeDetails;

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  void getQuestions() async {
    Response response;
    response = await FaqService().getQuestionsFromOffice(widget.officeName);
    print(response.data);

    //Map<String, dynamic> faqMap = jsonDecode(JSON);
    var faq = Faq.fromJSON(response.data);

    print(faq.location);
    print(faq.office_hours);
    print(faq.office_email);
    print(faq.questions);

    List<Question> questions = [];
    for (var question in faq.questions) {
      questions.add(Question.fromJSON(question));
    }

    print(questions);

    this.location = faq.location;
    this.office_hours = faq.office_hours;
    this.office_email = faq.office_email;
    this.questions = questions;
    //this.questions = faq.questions;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerScrimColor: Colors.transparent,
        key: _scaffoldKey,
        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: menuBar(),
        ),
        body: SizedBox(
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
                        widget.officeName,
                        style: GoogleFonts.montserrat(
                            textStyle: titleStyle, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          this.location,
                          style: GoogleFonts.montserrat(
                              textStyle: styleText,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          this.office_hours,
                          style: GoogleFonts.montserrat(
                              textStyle: styleText,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          this.office_email,
                          style: GoogleFonts.montserrat(
                              textStyle: styleText,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
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
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: HexColor('dee7f0'),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: questions.isNotEmpty
                          ? SingleChildScrollView(
                              child: Column(
                                  children: questions
                                      .map((q) => QuestionItem(
                                          question: q,
                                          office: Office(
                                              office_name: this.office_name,
                                              location: this.location,
                                              office_hours: this.office_hours,
                                              office_email: this.office_email),
                                          index: questions.indexOf(q),
                                          officeName: widget.officeName))
                                      .toList()),
                            )
                          : Text('loading'),
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
