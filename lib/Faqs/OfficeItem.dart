import 'package:abigail_askbilly/Faqs/QuestionPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OfficeItem extends StatelessWidget {
  final String buttonPath;
  final String officeName;
  const OfficeItem(
      {Key? key, required this.buttonPath, required this.officeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QuestionPage(
                    officeName: officeName,
                  )),
        );
      },
      child: Image.asset(buttonPath, width: 22.w, fit: BoxFit.contain),
    );
  }
}
