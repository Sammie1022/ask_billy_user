import 'package:abigail_askbilly/Classes/Floor.dart';

class Building {
  final String building_name;
  final String image_path;
  final List<Floor> floors;
  Building(
      {required this.building_name,
      required this.image_path,
      required this.floors});

  factory Building.fromJSON(Map<String, dynamic> data) {
    return Building(
        building_name: data['building_name'],
        image_path: data['image_path'],
        floors: iterateFloors(data['floors']));
  }

  static List<Floor> iterateFloors(data) {
    List<Floor> floors = [];
    for (var floor in data) {
      floors.add(Floor.fromJSON(floor));
    }

    return floors;
  }
}
