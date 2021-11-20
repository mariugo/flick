import 'package:flick/models/genre_model.dart';

final genreList = [
  GenreModel(id: 28, name: 'Ação'),
  GenreModel(id: 12, name: 'Aventura'),
  GenreModel(id: 16, name: 'Animação'),
  GenreModel(id: 35, name: 'Comédia'),
  GenreModel(id: 80, name: 'Crime'),
  GenreModel(id: 99, name: 'Documentário'),
  GenreModel(id: 18, name: 'Drama'),
  GenreModel(id: 14, name: 'Fantasia'),
  GenreModel(id: 10751, name: 'Família'),
  GenreModel(id: 36, name: 'História'),
  GenreModel(id: 27, name: 'Terror'),
  GenreModel(id: 10402, name: 'Música'),
  GenreModel(id: 9648, name: 'Mistério'),
  GenreModel(id: 10749, name: 'Romance'),
  GenreModel(id: 878, name: 'Ficção'),
  GenreModel(id: 10770, name: 'Cinema TV'),
  GenreModel(id: 53, name: 'Thriller'),
  GenreModel(id: 10752, name: 'Guerra'),
  GenreModel(id: 37, name: 'Faroeste'),
];

GenreModel? getGenreById(int id) =>
    genreList.firstWhere((genre) => genre.id == id);

String getGenreNameById(int id) => genreList
    .firstWhere(
      (genre) => genre.id == id,
      orElse: () => GenreModel(id: 0, name: ''),
    )
    .name;

int getGenreIdByName(String name) => genreList
    .firstWhere(
      (genre) => genre.name == name,
      orElse: () => GenreModel(id: 0, name: ''),
    )
    .id;

int tabToGenreId(int tab) {
  switch (tab) {
    case 0:
      return 28;
    case 1:
      return 12;
    case 2:
      return 14;
    case 3:
      return 35;
    default:
      return 28;
  }
}

// int tabToGenreId(int tab) {
//   switch (tab) {
//     case 0:
//       return 28;
//     case 1:
//       return 12;
//     case 2:
//       return 14;
//     case 3:
//       return 35;
//     case 4:
//       return 16;
//     case 5:
//       return 80;
//     case 6:
//       return 99;
//     case 7:
//       return 18;
//     case 8:
//       return 10751;
//     case 9:
//       return 36;
//     case 10:
//       return 27;
//     case 11:
//       return 10402;
//     case 12:
//       return 9648;
//     case 13:
//       return 10749;
//     case 14:
//       return 878;
//     case 15:
//       return 10770;
//     case 16:
//       return 53;
//     case 17:
//       return 10752;
//     case 18:
//       return 37;
//     default:
//       return 28;
//   }
// }
