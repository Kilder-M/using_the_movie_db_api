import 'package:flutter_test/flutter_test.dart';
import 'package:using_the_movie_db_api/app/data/dao/dio_impl.dart';
import 'package:using_the_movie_db_api/app/data/dao/genre_impl.dart';
import 'package:using_the_movie_db_api/app/domain/models/movie_model.dart';

void main() {
  group('Testing genre implements class: ', () {
    final genreImp = GenreImpl(DioImpl());
    test('should return a genre list', () async {
      List<Genre> genreList = await genreImp.getList();
      expect(genreList, isA<List<Genre>>());
    });

    test('should return a genre list', () async {
      List<Genre> genreList = await genreImp.getList();
      expect(genreList.length, equals(19));
    });
  });
}
