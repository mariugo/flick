import 'package:http/http.dart';
import 'package:http_get_cache/http_get_cache.dart';

class ApiCachedData {
  final GetCache _cache = GetCache.instance;

  ApiCachedData(GetCache _cache);

  factory ApiCachedData.initialize(GetCache cache) => ApiCachedData(cache);

  String get apiKey =>
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNmU0YThhNGUzZGZmOWVmNzZjYzY1YTIzN2M3ZDA5NiIsInN1YiI6IjYwZGM2NjFhY2I5ZjRiMDA1ZjViMmU0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KOj5K1PN8g2m6Ud8Lo9u9b_PJInpdY6WVU6dgSse5AU';

  Map<String, String> get authHeader => {
        'Content-Type': 'application/json;charset=utf-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $apiKey',
      };

  Future<Response> _getCache(String url) async =>
      await _cache.get(Uri.parse(url), headers: authHeader);

  Future<Response> getMoviesByGenre(int genre, {int page = 1}) async {
    final moviesByGenre =
        'https://api.themoviedb.org/3/discover/movie?language=pt-BR&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page&with_genres=$genre';
    return await _getCache(moviesByGenre);
  }

  Future<Response> getMovieDetail(int movieId) async {
    final movieDetail =
        'https://api.themoviedb.org/3/movie/$movieId?language=pt-BR&append_to_response=credits';
    return await _getCache(movieDetail);
  }

  Future<Response> searchMovies(String query, {int page = 1}) async {
    final moviesResult =
        'https://api.themoviedb.org/3/search/movie?language=pt-BR&page=$page&query=$query&include_adult=false';
    return await _getCache(moviesResult);
  }
}
