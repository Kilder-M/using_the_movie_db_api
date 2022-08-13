import 'package:using_the_movie_db_api/app/domain/models/similar_movies_model.dart';

abstract class SimilarMoviesInterface {
  Future<List<SimilarMovies>> getList(int id, [Map<String, dynamic> params]);
}
