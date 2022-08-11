import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:using_the_movie_db_api/app/data/api.dart';
import 'package:using_the_movie_db_api/app/modules/home/widgets/background_image_widget.dart';
import 'package:using_the_movie_db_api/app/modules/home/widgets/likes_and_popularity_row_widget.dart';
import 'package:using_the_movie_db_api/app/modules/home/widgets/list_tile_title_movie_widget.dart';
import 'package:using_the_movie_db_api/app/modules/home/widgets/list_title_movie_list_widget.dart';
import 'package:using_the_movie_db_api/app/widgets/back_button.widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.getMovie(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgressIndicator();
          } else {
            return BackgroundImageWidget(
              imageUrl:
                  API.requestMovieImage(controller.movie.value.posterPath!),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    backButtonRow(),
                    const Spacer(),
                    containerBlackContent(context),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Center circularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 1,
      ),
    );
  }

  Padding backButtonRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BackButtonWidget(
            onTapButton: () {},
          )
        ],
      ),
    );
  }

  Container containerBlackContent(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            spreadRadius: 8,
            blurRadius: 7,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () => ListTileMovieTitle(
              title: controller.movie.value.title,
              isTap: controller.isTapFavoriteIcon.value,
              onTapFavoriteIcon: () {
                controller.isTapFavoriteIcon.value =
                    !controller.isTapFavoriteIcon.value;
              },
            ),
          ),
          LikesAndPopularityRowWidget(
            popularityQuantity: controller.movie.value.popularity.toString(),
          ),
          FutureBuilder(
              future: controller.getSimilarMoviesList(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgressIndicator();
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.similarMoviesList.length,
                      itemBuilder: ((context, index) {
                        var genreList = ['teste01', 'teste02'];
                        var similarMovies = controller.similarMoviesList[index];
                        return ListTileMovieListWidget(
                            imageUrl:
                                API.requestMovieImage(similarMovies.posterPath),
                            textTitle: similarMovies.title,
                            genreList: genreList,
                            releaseDate: similarMovies.releaseDate.toString());
                      }),
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
