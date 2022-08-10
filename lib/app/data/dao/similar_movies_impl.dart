import 'package:dio/dio.dart';
import 'package:using_the_movie_db_api/app/data/api.dart';
import 'package:using_the_movie_db_api/app/data/dao/dio_impl.dart';
import 'package:using_the_movie_db_api/app/data/exceptions/data_layer_exception.dart';
import 'package:using_the_movie_db_api/app/domain/interfaces/similar_movies_interface.dart';
import 'package:using_the_movie_db_api/app/domain/models/similar_movies_model.dart';

class SimilarMoviesImpl implements SimilarMoviesInterface {
  final DioImpl _dio;

  SimilarMoviesImpl(this._dio);

  @override
  Future<List<SimilarMovies>> getList(int id) async {
    try {
      final response = await _dio.getDio().get(API.requestMoviesSimilar(id));
      List<SimilarMovies> movieSimiliarList = (response.data['results'] as List)
          .map((e) => SimilarMovies.fromJson(e))
          .toList();
      return movieSimiliarList;
    } on DioError catch (e) {
      throw DataLayerException(
          cause: 'error returning a similiar movies list\nErro: ${e.response}');
    }
  }
}
