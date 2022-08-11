class API {
  static String requestMovieImage(String imageUrl) =>
      'https://image.tmdb.org/t/p/w500/$imageUrl';

  static String requestMovie(int id) => '/movie/$id';

  static String requestMoviesSimilar(int id) => '/movie/$id/similar';
}
