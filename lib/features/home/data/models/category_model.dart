class CategoryModel {
  final String name;
  final String query;

  CategoryModel(this.name, this.query);
}

List<CategoryModel> categories = [
  CategoryModel('Business', 'business'),
  CategoryModel('Entertainment', 'entertainment'),
  CategoryModel('General', 'general'),
  CategoryModel('Health', 'health'),
  CategoryModel('Science', 'science'),
  CategoryModel('Sports', 'sports'),
  CategoryModel('Technology', 'technology'),
];
