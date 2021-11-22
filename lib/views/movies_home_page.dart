import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '/models/movie_detail_model.dart';
import '/views/movies_home_controller.dart';
import '/widgets/movie_tile.dart';
import '/widgets/tab_bar_chip.dart';
import '/design_system.dart';
import '/utils/genre_list_decoder.dart';

class MoviesHomePage extends StatefulWidget {
  const MoviesHomePage({Key? key}) : super(key: key);

  @override
  State<MoviesHomePage> createState() => _MoviesHomePageState();
}

class _MoviesHomePageState extends State<MoviesHomePage>
    with SingleTickerProviderStateMixin {
  final controller = Modular.get<MoviesHomeController>();
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchTextController.addListener(() {
      controller.performSearch(_searchTextController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleTextStyle: DS.appBarTitle,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            primary: true,
            pinned: true,
            title: const Text(
              'Filmes',
            ),
            elevation: 0,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              child: PreferredSize(
                preferredSize: const Size.fromHeight(110),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.center,
                          end: FractionalOffset.bottomCenter,
                          colors: <Color>[
                            Colors.white,
                            Colors.white,
                            Colors.white.withOpacity(1),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 47,
                            child: TextField(
                              controller: _searchTextController,
                              decoration: InputDecoration(
                                fillColor: DS.greyPrimaryColor,
                                filled: true,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                ),
                                hintText: 'Pesquise filmes',
                                hintStyle: DS.searchBarText,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Observer(
                            builder: (context) {
                              return TabChips(
                                labels: const [
                                  'Ação',
                                  'Aventura',
                                  'Fantasia',
                                  'Comédia',
                                ],
                                selectedIndex: controller.tabIndex,
                                onChanged: (value) {
                                  controller.tabIndex = value;
                                  final genre = tabToGenreId(value);
                                  controller.changeGenre(genre);
                                  _searchTextController.clear();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: PagedSliverList.separated(
              builderDelegate: PagedChildBuilderDelegate<MovieDetailModel>(
                itemBuilder: (context, item, index) => MovieTile(
                  movie: item,
                  onTap: () => Modular.to.pushNamed('/detail', arguments: item),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox.fromSize(
                size: const Size.fromHeight(16),
              ),
              pagingController: controller.pagingController,
            ),
          ),
        ],
      ),
    );
  }
}

/// Header permanente usando Sliver
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
