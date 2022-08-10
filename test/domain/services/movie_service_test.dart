import 'package:flutter_test/flutter_test.dart';
import 'package:using_the_movie_db_api/app/data/dao/dio_impl.dart';
import 'package:using_the_movie_db_api/app/data/dao/movie_impl.dart';
import 'package:using_the_movie_db_api/app/domain/models/movie_model.dart';
import 'package:using_the_movie_db_api/app/domain/services/movie_service.dart';

void main() {
  group('Testing movie service methods:', () {
    final movieService = MovieService(MovieImpl(DioImpl()));

    test('Should return a movie', () async {
      final movie = await movieService.getMovie(550);

      expect(movie, isA<Movie>());
    });

    test('Should return the correct id', () async {
      final movie = await movieService.getMovie(550);

      expect(movie.id, equals(550));
    });
  });
}
