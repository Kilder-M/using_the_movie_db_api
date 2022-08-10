import 'package:flutter_test/flutter_test.dart';
import 'package:using_the_movie_db_api/app/data/dao/dio_impl.dart';
import 'package:using_the_movie_db_api/app/data/dao/similar_movies_impl.dart';
import 'package:using_the_movie_db_api/app/domain/models/similar_movies_model.dart';

void main() {
  final dioImpl = DioImpl();
  final similarMoviesImpl = SimilarMoviesImpl(dioImpl);

  group('Test about get a similar movies list: ', () {
    test('should return a similar movies list', () async {
      List<SimilarMovies> similarMoviesList =
          await similarMoviesImpl.getList(550);

      expect(similarMoviesList, isA<List<SimilarMovies>>());
    });

    test('should return the correct lenght', () async {
      List<SimilarMovies> similarMoviesList =
          await similarMoviesImpl.getList(550);

      expect(similarMoviesList.length, equals(20));
    });
  });
}
