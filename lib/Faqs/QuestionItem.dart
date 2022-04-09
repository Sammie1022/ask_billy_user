import 'package:abigail_askbilly/Classes/Office.dart';
import 'package:abigail_askbilly/Classes/Question.dart';
import 'package:abigail_askbilly/Faqs/AnswerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class QuestionItem extends StatefulWidget {
  final Question question;
  final Office office;
  final int index;
  final String officeName;
  QuestionItem(
      {required this.question,
      required this.index,
      required this.officeName,
      required this.office});

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  final styleText = TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h, left: 10.w, right: 10.w),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AnswerPage(
                      question: widget.question,
                      officeName: widget.officeName,
                      index: widget.index,
                      office: widget.office,
                    )),
          );
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
          textStyle: MaterialStateProperty.resolveWith(
            (states) => TextStyle(color: Colors.white),
          ),
          elevation: MaterialStateProperty.resolveWith((states) => 5.0),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return HexColor('061e47');
              return HexColor('af9f30');
            },
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: Text(
            widget.question.question,
            style: GoogleFonts.montserrat(
                textStyle: styleText,
                fontWeight: FontWeight.normal,
                fontSize: 10.sp),
          ),
        ),
      ),
    );
  }
}
