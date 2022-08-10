import 'package:flutter_test/flutter_test.dart';
import 'package:using_the_movie_db_api/app/data/dao/dio_impl.dart';
import 'package:using_the_movie_db_api/app/data/dao/movie_impl.dart';
import 'package:using_the_movie_db_api/app/domain/models/movie_model.dart';

void main() {
  final dioImpl = DioImpl();
  final movieImpl = MovieImpl(dioImpl);

  group('Test about get a movie: ', () {
    test('should return a movie object', () async {
      Movie movie = await movieImpl.getMovieById(550);
      expect(movie, isA<Movie>());
    });

    test('should return the correct id', () async {
      Movie movie = await movieImpl.getMovieById(550);
      expect(movie.id, equals(550));
    });
  });
}
