import 'dart:ffi';

import 'package:using_the_movie_db_api/app/data/dao/genre_impl.dart';
import 'package:using_the_movie_db_api/app/domain/models/movie_model.dart';

class GenreService {
  final GenreImpl _genreImpl;
  GenreService(this._genreImpl);

  Future<List<Genre>> getList() async {
    return await _genreImpl.getList();
  }
}
