class SourcesModel {
  String id;
  String name;

  SourcesModel({required this.id, required this.name});

  static List<SourcesModel> sources = List.generate(
    10,
    (index) => SourcesModel(id: '', name: 'Source${index + 1}'),
  );
}
