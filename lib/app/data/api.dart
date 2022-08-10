class API {
  static String requestMovie(int id) => '/movie/$id';

  static String requestMoviesSimilar(int id) => '/movie/$id/similar';
}
