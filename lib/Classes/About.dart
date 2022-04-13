import 'package:flutter/cupertino.dart';

import 'SubCategory.dart';

class About {
  final String category;
  final List<SubCategory> subcategories;

  About({required this.category, required this.subcategories});

  factory About.fromJSON(Map<String, dynamic> data) {
    return About(
        category: data['category'],
        subcategories: iterateSubcategories(data['subcategories']));
  }

  static List<SubCategory> iterateSubcategories(data) {
    List<SubCategory> subcategories = [];
    for (var subcategory in data) {
      subcategories.add(subcategory.fromJSON(subcategory));
    }
    return subcategories;
  }
}
