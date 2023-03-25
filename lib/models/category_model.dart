final categoryImageMap = {
  'Banque': 'bank.png',
  'Santé': 'health.png',
  'Électricité': 'electricity.png',
};

class CategoryModel {
  String label;
  String illustrationFilename;

  CategoryModel({
    required this.label,
    required this.illustrationFilename,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> jsonMap) {
    return CategoryModel(
      label: jsonMap['label'],
      illustrationFilename: categoryImageMap[jsonMap['label']] ?? '',
    );
  }
}