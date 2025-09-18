class CategoryModel {
  final String name;
  final String query;

  CategoryModel(this.name, this.query);
}

List<CategoryModel> categoriesList = [
  CategoryModel('General', 'general'),
  CategoryModel('Business', 'business'),
  CategoryModel('Entertainment', 'entertainment'),
  CategoryModel('Health', 'health'),
  CategoryModel('Science', 'science'),
  CategoryModel('Sports', 'sports'),
  CategoryModel('Technology', 'technology'),
];
