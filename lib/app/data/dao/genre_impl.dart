import 'package:dio/dio.dart';
import 'package:using_the_movie_db_api/app/data/api.dart';
import 'package:using_the_movie_db_api/app/data/dao/dio_impl.dart';
import 'package:using_the_movie_db_api/app/data/exceptions/data_layer_exception.dart';
import 'package:using_the_movie_db_api/app/domain/interfaces/genre_interface.dart';
import 'package:using_the_movie_db_api/app/domain/models/movie_model.dart';

class GenreImpl implements GenreInterface {
  final DioImpl _dioImpl;
  GenreImpl(this._dioImpl);
  @override
  Future<List<Genre>> getList() async {
    try {
      var response = await _dioImpl.getDio().get(API.requestGenre());
      return (response.data['genres'] as List)
          .map((e) => Genre.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw DataLayerException(
          cause: 'error returning a genre list\nErro: ${e.response}');
    }
  }
}
