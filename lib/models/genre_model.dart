class GenreModel {
  final int id;
  final String name;

  GenreModel({
    required this.id,
    required this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> _json) => GenreModel(
        id: _json['id'],
        name: _json['name'],
      );
}
