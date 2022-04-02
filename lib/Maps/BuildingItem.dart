import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'mainBuilding.dart';

class BuildingItem extends StatefulWidget {
  final String buildingName;

  BuildingItem({required this.buildingName});

  @override
  _BuildingItemState createState() => _BuildingItemState();
}

class _BuildingItemState extends State<BuildingItem> {
  final btnStyle = TextStyle(fontSize: 3.3.h, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => mainBuilding(
                    buildingName: widget.buildingName,
                  )),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 1.h),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: HexColor('af9f30'),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 1.w,
            ),
            Text(
              widget.buildingName,
              style: GoogleFonts.montserrat(
                  textStyle: btnStyle, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 2.w,
            )
          ],
        ),
      ),
    );
  }
}
