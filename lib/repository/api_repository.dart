import 'dart:convert';

import '/api_cached/api_cached_data.dart';
import '/models/movie_detail_model.dart';
import '/models/movie_model.dart';

class ApiRepository {
  final ApiCachedData apiCachedData;

  ApiRepository(this.apiCachedData);

  Future<MovieModel> getMovieDetail(int movieId) async {
    final response = await apiCachedData.getMovieDetail(movieId);
    final Map<String, dynamic> json = jsonDecode(response.body);
    return MovieModel.fromJson(json);
  }

  Future<List<MovieDetailModel>> getMoviesByGenre(int genre,
      {int page = 1}) async {
    final response = await apiCachedData.getMoviesByGenre(genre, page: page);
    final Map<String, dynamic> json = jsonDecode(response.body);
    final movieList = json['results'] as List;
    return movieList.map((movie) => MovieDetailModel.fromJson(movie)).toList();
  }

  Future<List<MovieDetailModel>> searchMovies(String query,
      {int page = 1}) async {
    final response = await apiCachedData.searchMovies(query, page: page);
    final Map<String, dynamic> json = jsonDecode(response.body);
    final movieList = json['results'] as List;
    return movieList.map((movie) => MovieDetailModel.fromJson(movie)).toList();
  }
}
