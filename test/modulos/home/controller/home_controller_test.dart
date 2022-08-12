import 'package:flutter_test/flutter_test.dart';
import 'package:using_the_movie_db_api/app/domain/models/movie_model.dart';
import 'package:using_the_movie_db_api/app/domain/models/similar_movies_model.dart';
import 'package:using_the_movie_db_api/app/modules/home/controllers/home_controller.dart';

void main() {
  group('Testing home controller: class', () {
    final homeController = HomeController();

    test('Should return a movie', () async {
      final movie = await homeController.getMovie();
      expect(movie, isA<Movie>());
    });

    test('Should return a similar movie list', () async {
      final similarMoviesList = await homeController.getSimilarMoviesList();
      expect(similarMoviesList, isA<List<SimilarMovies>>());
    });

    test('Should return a genre list', () async {
      final genreList = await homeController.getGenreList();
      expect(genreList, isA<List<Genre>>());
    });
  });
}
