import 'package:abigail_askbilly/Classes/Building.dart';
import 'package:abigail_askbilly/Classes/Facility.dart';

class Floor {
  final String floor_number;
  final List<Facility> facilities;
  Floor({required this.floor_number, required this.facilities});

  factory Floor.fromJSON(Map<String, dynamic> data) {
    return Floor(
        floor_number: data['floor_number'],
        facilities: iterateFacilities(data['facilities']));
  }

  static List<Facility> iterateFacilities(data) {
    List<Facility> facilities = [];
    for (var facility in data) {
      facilities.add(Facility.fromJSON(facility));
    }

    return facilities;
  }
}
