import 'package:flick/models/movie_model.dart';
import 'package:flick/repository/api_repository.dart';
import 'package:mobx/mobx.dart';

part 'movie_page_controller.g.dart';

class MoviePageController = _MoviePageControllerBase with _$MoviePageController;

abstract class _MoviePageControllerBase with Store {
  final ApiRepository _repository;

  _MoviePageControllerBase(this._repository);

  static ObservableFuture<MovieModel?> emptyResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<MovieModel?> fetchReposFuture = emptyResponse;

  @observable
  bool isLoading = false;

  MovieModel? movieDetail;

  @action
  Future<MovieModel?> fetchRepos(int movieId) async {
    movieDetail = null;
    final future = _repository.getMovieDetail(movieId);
    fetchReposFuture = ObservableFuture(future);

    return movieDetail = await future;
  }

  Future<MovieModel> getDetail(int movieId) async {
    isLoading = true;
    return await _repository
        .getMovieDetail(movieId)
        .whenComplete(() => isLoading = false);
  }
}
