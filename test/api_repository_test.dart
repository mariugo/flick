@Timeout(Duration(seconds: 5))

import 'dart:convert';
import 'package:flick/models/movie_detail_model.dart';
import 'package:flick/models/movie_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  final client = http.Client();

  String apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNmU0YThhNGUzZGZmOWVmNzZjYzY1YTIzN2M3ZDA5NiIsInN1YiI6IjYwZGM2NjFhY2I5ZjRiMDA1ZjViMmU0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KOj5K1PN8g2m6Ud8Lo9u9b_PJInpdY6WVU6dgSse5AU';

  Map<String, String> authHeader = {
    'Content-Type': 'application/json;charset=utf-8',
    'Accept': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  Future<MovieModel> getMovieDetail(client, int movieId) async {
    final response = await client.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId?language=pt-BR&append_to_response=credits'),
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get movie detail');
    }
  }

  Future<List<MovieDetailModel>> searchMovie(client, String query,
      {int page = 1}) async {
    final response = await client.get(
      Uri.parse(
          'https://api.themoviedb.org/3/search/movie?language=pt-BR&page=$page&query=$query&include_adult=false'),
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final movieList = json['results'] as List;
      return movieList
          .map((movie) => MovieDetailModel.fromJson(movie))
          .toList();
    } else {
      throw Exception('Failed to search movie');
    }
  }

  Future<List<MovieDetailModel>> getMoviesByGenre(client, String genre,
      {int page = 1}) async {
    final response = await client.get(
      Uri.parse(
          'https://api.themoviedb.org/3/discover/movie?language=pt-BR&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page&with_genres=$genre'),
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final movieList = json['results'] as List;
      return movieList
          .map((movie) => MovieDetailModel.fromJson(movie))
          .toList();
    } else {
      throw Exception('Failed to get movies by genre');
    }
  }

  group('Testing API repository methods', () {
    test('Should return a Movie Instance', () async {
      final response = await getMovieDetail(client, 500);
      expect(response, isA<MovieModel>());
    });

    test('Should return a Movie called Cães de Aluguel', () async {
      final response = await getMovieDetail(client, 500);
      expect(response.title, 'Cães de Aluguel');
      expect(response.id, 500);
      expect(response.posterPath, "/yONcf5ZI2VMe8EcpV7YqJDGsS6z.jpg");
      expect(response.voteAverage, 8.2);
    });

    test('Should return a Titanic movie', () async {
      final response = await searchMovie(client, 'Titanic');
      expect(response.first.title, 'Titanic');
    });

    test('Should return Action movies', () async {
      final response = await getMoviesByGenre(client, 'Ação');
      expect(response.isNotEmpty, true);
      expect(response, isA<List<MovieDetailModel>>());
      expect(response.first.genres, isA<List<dynamic>>());
    });
  });
}
