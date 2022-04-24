import 'package:abigail_askbilly/Classes/Office.dart';
import 'package:abigail_askbilly/Classes/Question.dart';

class Faq {
  final String office_name;
  final String location;
  final String office_hours;
  final String office_email;
  final String image_path;
  final List questions;

  Faq(
      {required this.office_name,
      required this.location,
      required this.office_hours,
      required this.office_email,
      required this.image_path,
      required this.questions});

  factory Faq.fromJSON(Map<String, dynamic> data) {
    return Faq(
      office_name: data['office_name'],
      location: data['location'],
      office_hours: data['office_hours'],
      office_email: data['office_email'],
      image_path: data['image_path'] ?? ' ',
      questions: data['questions'],
    );
  }
}
