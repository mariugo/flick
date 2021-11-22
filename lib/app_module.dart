import 'package:flutter_modular/flutter_modular.dart';
import 'package:http_get_cache/http_get_cache.dart';

import 'api_cached/api_cached_data.dart';
import 'module/movies_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => ApiCachedData.initialize(GetCache.instance),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: MoviesModule(),
        ),
      ];
}
