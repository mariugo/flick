import 'package:flick/models/genre_model.dart';

class MovieModel {
  final int id;
  final String title;
  final String origialTitle;
  final double voteAverage;
  final DateTime releaseDate;
  final List<GenreModel> genres;
  final String? posterPath;
  final int? runtime;
  final int budget;
  final List<String> companies;
  final String overview;
  final List<String> cast;
  final List<String> crew;

  MovieModel({
    required this.id,
    required this.title,
    required this.origialTitle,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
    this.posterPath,
    this.runtime,
    required this.budget,
    required this.companies,
    required this.overview,
    required this.cast,
    required this.crew,
  });

  factory MovieModel.fromJson(Map<String, dynamic> _json) => MovieModel(
        id: _json['id'],
        title: _json['title'],
        origialTitle: _json['original_title'],
        voteAverage: _json['vote_average'],
        releaseDate: DateTime.parse(_json['release_date']),
        genres: _parseGenreList(_json['genres'] as List),
        posterPath: _json['poster_path'] ??
            'https://image.tmdb.org/t/p/w500/${_json['poster_path']}',
        runtime: _json['runtime'],
        budget: _json['budget'],
        companies: _parseCompaniesList(_json['production_companies']),
        overview: _json['overview'],
        cast: _parseCastList(_json['credits']['cast']),
        crew: _parseCrewProducerList(_json['credits']['crew']),
      );
}

List<GenreModel> _parseGenreList(List list) {
  return list.map((genre) => GenreModel.fromJson(genre)).toList();
}

List<String> _parseCompaniesList(List list) {
  return list.map((company) => company['name'] as String).toList();
}

List<String> _parseCastList(List list) {
  return list.map((member) => member['name'] as String).toList().sublist(0, 6);
}

List<String> _parseCrewProducerList(List list) {
  return list
      .where((director) => (director['job'] as String) == 'Director')
      .map((crew) => crew['name'] as String)
      .toList();
}
