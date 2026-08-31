class CategoryModel {
  String id;
  String name;
  String imageName;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageName,
  });

  static List<CategoryModel> categories = [
    CategoryModel(id: '', name: 'General', imageName: 'general'),
    CategoryModel(id: '', name: 'Business', imageName: 'busniess'),
    CategoryModel(id: '', name: 'Sports', imageName: 'sport'),
    CategoryModel(id: '', name: 'Technology', imageName: 'technology'),
    CategoryModel(id: '', name: 'Entertainment', imageName: 'entertainment'),
    CategoryModel(id: '', name: 'Health', imageName: 'helth'),
    CategoryModel(id: '', name: 'Science', imageName: 'science'),
  ];
}
