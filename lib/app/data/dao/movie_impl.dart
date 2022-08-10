import 'package:dio/dio.dart';
import 'package:using_the_movie_db_api/app/data/api.dart';
import 'package:using_the_movie_db_api/app/data/dao/dio_impl.dart';
import 'package:using_the_movie_db_api/app/data/exceptions/data_layer_exception.dart';
import 'package:using_the_movie_db_api/app/domain/interfaces/movie_interface.dart';
import 'package:using_the_movie_db_api/app/domain/models/movie_model.dart';

class MovieImpl implements MovieInterface {
  final DioImpl _dio;

  MovieImpl(this._dio);

  @override
  Future<Movie> getMovieById(int id) async {
    try {
      final response = await _dio.getDio().get(API.requestMovie(id));
      return Movie.fromJson(response.data);
    } on DioError catch (e) {
      throw DataLayerException(
          cause: 'error returning a movie\nErro: ${e.response}');
    }
  }
}
