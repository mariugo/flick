import 'package:flick/pages/movie_detail_page.dart';
import 'package:flick/pages/movie_page_controller.dart';
import 'package:flick/repository/api_repository.dart';
import 'package:flick/views/movies_home_controller.dart';
import 'package:flick/views/movies_home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoviesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => ApiRepository(i.get()),
        ),
        Bind.singleton(
          (i) => MoviesHomeController(
            i.get(),
          ),
        ),
        Bind.singleton(
          (i) => MoviePageController(
            i.get(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const MoviesHomePage(),
        ),
        ChildRoute(
          '/detail',
          child: (context, args) => MovieDetailPage(
            movieItem: args.data,
          ),
        ),
      ];
}
