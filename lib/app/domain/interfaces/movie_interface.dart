import 'package:using_the_movie_db_api/app/domain/models/movie_model.dart';

abstract class MovieInterface {
  Future<Movie> getMovieById(int id);
}
