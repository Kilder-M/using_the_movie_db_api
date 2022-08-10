import 'package:using_the_movie_db_api/app/data/dao/movie_impl.dart';
import 'package:using_the_movie_db_api/app/domain/models/movie_model.dart';

class MovieService {
  final MovieImpl _movieImpl;

  MovieService(this._movieImpl);

  Future<Movie> getMovie(int id) async {
    return await _movieImpl.getMovieById(id);
  }
}
