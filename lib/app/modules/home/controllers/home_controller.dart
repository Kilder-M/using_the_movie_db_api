import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:using_the_movie_db_api/app/data/dao/dio_impl.dart';
import 'package:using_the_movie_db_api/app/data/dao/genre_impl.dart';
import 'package:using_the_movie_db_api/app/data/dao/movie_impl.dart';
import 'package:using_the_movie_db_api/app/data/dao/similar_movies_impl.dart';
import 'package:using_the_movie_db_api/app/domain/models/movie_model.dart';
import 'package:using_the_movie_db_api/app/domain/models/similar_movies_model.dart';
import 'package:using_the_movie_db_api/app/domain/services/genre_service.dart';
import 'package:using_the_movie_db_api/app/domain/services/movie_service.dart';
import 'package:using_the_movie_db_api/app/domain/services/similar_movies_service.dart';

class HomeController extends GetxController {
  final _movieService = MovieService(MovieImpl(DioImpl()));
  final _genderService = GenreService(GenreImpl(DioImpl()));
  final _similarMoviesService =
      SimilarMoviesService(SimilarMoviesImpl(DioImpl()));
  final scrollController = ScrollController();

  var movie = Movie().obs;
  var similarMoviesList = <SimilarMovies>[].obs;
  var genrelist = <Genre>[].obs;
  var isTapFavoriteIcon = false.obs;
  var page = 1.obs;
  HomeController() {
    getPagination();
    getGenreList();
    getMovie();
    getSimilarMoviesList();
  }

  Future<Movie> getMovie() async {
    return movie.value = await _movieService.getMovie(324786);
  }

  Future<List<SimilarMovies>> getSimilarMoviesList(
      [Map<String, dynamic>? params]) async {
    return similarMoviesList.value =
        await _similarMoviesService.getList(324786, params);
  }

  Future<List<Genre>> getGenreList() async {
    return genrelist.value = await _genderService.getList();
  }

  getPagination() {
    scrollController.addListener(
      () async {
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange) {
          var response = await _similarMoviesService
              .getList(324786, {'page': page.value + 1});
          similarMoviesList.addAll(response.map((e) => e).toList());
          page.value++;
        }
      },
    );
  }
}
