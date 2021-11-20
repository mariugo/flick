class MovieDetailModel {
  final int id;
  final String title;
  final List<dynamic> genres;
  final String? posterPath;

  MovieDetailModel({
    required this.id,
    required this.title,
    required this.genres,
    this.posterPath,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> _json) =>
      MovieDetailModel(
        id: _json['id'],
        title: _json['title'],
        genres: List.castFrom<dynamic, dynamic>(_json['genre_ids']).toList(),
        posterPath: _json['poster_path'] != null
            ? 'https://image.tmdb.org/t/p/w500/${_json['poster_path']}'
            : null,
      );
}
