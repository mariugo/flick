import 'package:flutter_test/flutter_test.dart';
import 'package:flick/models/genre_model.dart';

void main() {
  final genreModel = GenreModel(
    id: 1,
    name: 'Teste',
  );

  test('Should be a GenreModel Instance', () {
    expect(genreModel, isA<GenreModel>());
  });
}
