import 'package:abigail_askbilly/enums/device_type_screen.dart';
import 'package:flutter/material.dart';

class SizingInformation {
  final Orientation landscape;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    required this.landscape,
    required this.deviceScreenType,
    required this.screenSize,
    required this.localWidgetSize,
  });

  @override
  String toString() {
    return 'Orientation:$landscape DeviceScreenType:$deviceScreenType Size:$screenSize Size:$localWidgetSize';
  }
}
