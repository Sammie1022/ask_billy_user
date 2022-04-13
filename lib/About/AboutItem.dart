import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import 'Abouthome.dart';

class AboutItem extends StatefulWidget {
  final IconData icon;
  final String label;
  const AboutItem({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  State<AboutItem> createState() => _AboutItemState();
}

class _AboutItemState extends State<AboutItem> {
  final btnStyle = TextStyle(fontSize: 3.h, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2.w),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => aboutHome()),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          primary: HexColor('061e47'),
          elevation: 5,
          // padding: EdgeInsets.symmetric(
          //     vertical: 2.h, horizontal: 7.w),
        ),
        icon: Icon(
          widget.icon,
          size: 4.h,
        ),
        label: Text(
          widget.label,
          style: GoogleFonts.montserrat(
              textStyle: btnStyle,
              fontWeight: FontWeight.w500,
              fontSize: 10.sp),
        ),
      ),
    );
  }
}
