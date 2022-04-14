class SubCategory {
  final String subcategory;
  final String description;

  SubCategory({
    required this.subcategory,
    required this.description,
  });

  factory SubCategory.fromJSON(Map<String, dynamic> data) {
    return SubCategory(
      subcategory: data['subcategory'],
      description: data['description'],
    );
  }
}
