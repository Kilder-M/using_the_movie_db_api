import 'package:flutter_test/flutter_test.dart';
import 'package:using_the_movie_db_api/app/data/dao/dio_impl.dart';
import 'package:using_the_movie_db_api/app/data/dao/genre_impl.dart';
import 'package:using_the_movie_db_api/app/domain/models/movie_model.dart';
import 'package:using_the_movie_db_api/app/domain/services/genre_service.dart';

void main() {
  group('Testing genre service methods:', () {
    final genreService = GenreService(GenreImpl(DioImpl()));

    test('Should return a genre list', () async {
      final genreList = await genreService.getList();

      expect(genreList, isA<List<Genre>>());
    });

    test('Should return the correct lenght', () async {
      final genreList = await genreService.getList();

      expect(genreList.length, equals(19));
    });
  });
}
