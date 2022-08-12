import 'package:flutter_test/flutter_test.dart';
import 'package:using_the_movie_db_api/app/data/dao/dio_impl.dart';
import 'package:using_the_movie_db_api/app/data/dao/similar_movies_impl.dart';
import 'package:using_the_movie_db_api/app/domain/models/similar_movies_model.dart';
import 'package:using_the_movie_db_api/app/domain/services/similar_movies_service.dart';

void main() {
  group('Testing movie service class:', () {
    final similarMoviesService =
        SimilarMoviesService(SimilarMoviesImpl(DioImpl()));

    test('Should return a movie', () async {
      final similarMoviesList = await similarMoviesService.getList(550);

      expect(similarMoviesList, isA<List<SimilarMovies>>());
    });

    test('Should return the correct lenght', () async {
      final similarMoviesList = await similarMoviesService.getList(550);

      expect(similarMoviesList.length, equals(20));
    });
  });
}
