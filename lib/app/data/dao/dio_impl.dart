import 'package:dio/dio.dart';
import 'package:using_the_movie_db_api/app/domain/interfaces/dio_interface.dart';

class DioImpl implements DioInterface {
  @override
  Dio getDio() {
    return Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3/', headers: {
      'contentType': 'aplication/json;charset=utf-8',
      'authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5Y2E2NjZjODgxODEzMDg1YTYyNDk4MWYzMDRkMTJjMSIsInN1YiI6IjYyZjJhZTNiMWY3NDhiMDA4NDg3ZmQ5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dZ1ElTDD08mpZH_wEall7yg-WuRB2ZmJrTY4T2F4Pk0'
    }));
  }
}
