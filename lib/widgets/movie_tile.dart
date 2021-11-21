import 'package:cached_network_image/cached_network_image.dart';
import 'package:flick/models/movie_detail_model.dart';
import 'package:flick/design_system.dart';
import 'package:flick/utils/genre_list_decoder.dart';
import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final VoidCallback onTap;
  final MovieDetailModel movie;

  const MovieTile({
    Key? key,
    required this.movie,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: movie.posterPath ?? 'Sem Imagem',
        placeholderFadeInDuration: const Duration(milliseconds: 600),
        fadeInDuration: const Duration(milliseconds: 600),
        fadeOutDuration: const Duration(milliseconds: 600),
        imageBuilder: (context, imageProvider) {
          return Hero(
            tag: movie.posterPath ?? movie.id,
            child: Container(
              width: 320.0,
              height: 470.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageProvider,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                color: Colors.grey,
              ),
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(bottom: 32.0, left: 24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.center,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.43),
                      Colors.black.withOpacity(1),
                    ],
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      movie.title,
                      style: DS.movieCardTitle,
                    ),
                    SizedBox.fromSize(
                      size: const Size.fromHeight(12),
                    ),
                    Text(
                      movie.genres
                          .map((genre) => getGenreNameById(genre))
                          .join(' - '),
                      style: DS.genreCardTextTitle,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
