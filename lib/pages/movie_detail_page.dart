import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '/models/movie_model.dart';
import '/models/movie_detail_model.dart';
import '/pages/movie_page_controller.dart';
import '/design_system.dart';
import '/utils/duration_converter.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieDetailModel movieItem;
  const MovieDetailPage({Key? key, required this.movieItem}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final controller = Modular.get<MoviePageController>();
  MovieModel? _movieDetail;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _movieDetail = await controller.getDetail(widget.movieItem.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: DS.greySecondaryColor,
            foregroundColor: Colors.black,
            primary: true,
            pinned: false,
            automaticallyImplyLeading: false,
            title: ActionChip(
              backgroundColor: Colors.white,
              avatar: const Icon(
                Icons.arrow_back_ios,
                size: 10,
                color: Colors.black,
              ),
              label: const Text('Voltar'),
              shape: const StadiumBorder(),
              elevation: 0.5,
              onPressed: () {
                Modular.to.pop();
              },
            ),
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 0,
                    child: IntrinsicWidth(
                      child: Container(
                        height: 203,
                        width: MediaQuery.of(context).size.width,
                        color: DS.greySecondaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 36,
                    left: MediaQuery.of(context).size.width / 4,
                    child: Hero(
                      tag: widget.movieItem.posterPath ?? widget.movieItem.id,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        child: SizedBox(
                          height: 318,
                          width: 216,
                          child: Image(
                            image: CachedNetworkImageProvider(
                              widget.movieItem.posterPath!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Observer(
                    builder: (context) {
                      if (controller.isLoading) {
                        return const CircularProgressIndicator.adaptive();
                      } else {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _movieDetail?.voteAverage.toString() ??
                                  'Sem nota',
                              style: DS.ratingReceivedText,
                            ),
                            Text('/10', style: DS.ratingDefaultText),
                          ],
                        );
                      }
                    },
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(32),
                  ),
                  Text(
                    widget.movieItem.title.toUpperCase(),
                    style: DS.ratingDefaultText,
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(12),
                  ),
                  Observer(
                    builder: (context) {
                      if (controller.isLoading) {
                        return const CircularProgressIndicator.adaptive();
                      } else {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Título original: ',
                                  style: DS.originalTitleText,
                                ),
                                Text(
                                  _movieDetail?.origialTitle ??
                                      widget.movieItem.title,
                                  style: DS.originalTitleText,
                                ),
                              ],
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(32),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Ano: ',
                                      style: DS.yearDurationTextLabel,
                                    ),
                                    Text(
                                      _movieDetail?.releaseDate.year
                                              .toString() ??
                                          'Sem data',
                                      style: DS.yearDurationBudgetProducerText,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Duração: ',
                                      style: DS.yearDurationBudgetProducerText,
                                    ),
                                    Text(
                                      formatDuration(
                                        _movieDetail?.runtime ?? 0,
                                      ),
                                      style: DS.yearDurationBudgetProducerText,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(12),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 8,
                              children: [
                                ..._movieDetail!.genres
                                    .map<Widget>(
                                      (e) => Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: DS.greySecondaryColor,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        child: Text(
                                          e.name.toUpperCase(),
                                          style: DS.genreDetailText,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ],
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(56),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Descrição',
                                  style: DS.genreDetailText,
                                ),
                                SizedBox.fromSize(
                                  size: const Size.fromHeight(8),
                                ),
                                Text(
                                  _movieDetail?.overview ?? 'Sem descrição',
                                  style: DS.movieOverviewDirectorCrewDetailText,
                                ),
                              ],
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(40),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                left: 16,
                                bottom: 8,
                                top: 8,
                              ),
                              decoration: const BoxDecoration(
                                color: DS.greySecondaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'ORÇAMENTO: ',
                                    style: DS.budgetProducersText,
                                  ),
                                  Text(
                                    '\$ ' +
                                        NumberFormat('#,##0', 'en_US')
                                            .format(_movieDetail?.budget ?? 0),
                                    style: DS.yearDurationBudgetProducerText,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(4),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                left: 16,
                                bottom: 8,
                                top: 8,
                                right: 16,
                              ),
                              decoration: const BoxDecoration(
                                color: DS.greySecondaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              width: double.infinity,
                              child: Wrap(
                                spacing: 8,
                                children: [
                                  Text(
                                    'PRODUTORAS: ',
                                    style: DS.budgetProducersText,
                                  ),
                                  ..._movieDetail!.companies.map<Widget>(
                                    (e) => Text(
                                      e,
                                      style: DS.yearDurationBudgetProducerText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(40),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Diretor',
                                  style: DS.descriptonDirectorCrewText,
                                ),
                                SizedBox.fromSize(
                                  size: const Size.fromHeight(8),
                                ),
                                Text(
                                  _movieDetail?.crew.join(', ') ?? '',
                                  style: DS.movieOverviewDirectorCrewDetailText,
                                ),
                              ],
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(32),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Elenco',
                                  style: DS.descriptonDirectorCrewText,
                                ),
                                SizedBox.fromSize(
                                  size: const Size.fromHeight(8),
                                ),
                                Text(
                                  _movieDetail?.cast.join(', ') ?? '',
                                  style: DS.movieOverviewDirectorCrewDetailText,
                                ),
                              ],
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(90),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
