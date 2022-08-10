import 'package:using_the_movie_db_api/app/data/dao/similar_movies_impl.dart';
import 'package:using_the_movie_db_api/app/domain/models/similar_movies_model.dart';

class SimilarMoviesService {
  final SimilarMoviesImpl _similarMoviesImpl;
  SimilarMoviesService(this._similarMoviesImpl);

  Future<List<SimilarMovies>> getList(int id) async {
    return await _similarMoviesImpl.getList(id);
  }
}
