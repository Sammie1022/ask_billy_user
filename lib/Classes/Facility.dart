class Facility {
  final String facility_name;
  final String facility_description;
  final String facility_image_path;
  final String facility_path_guide;

  Facility(
      {required this.facility_name,
      required this.facility_description,
      required this.facility_image_path,
      required this.facility_path_guide});

  factory Facility.fromJSON(Map<String, dynamic> data) {
    return Facility(
        facility_name: data['facility_name'],
        facility_description: data['facility_description'],
        facility_image_path: data['facility_image_path'],
        facility_path_guide: data['facility_path_guide']);
  }
}
