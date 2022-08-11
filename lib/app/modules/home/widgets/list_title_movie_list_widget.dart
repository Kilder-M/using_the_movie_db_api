import 'package:flutter/material.dart';
import 'package:using_the_movie_db_api/app/widgets/image_network_widget.dart';

class ListTileMovieListWidget extends StatelessWidget {
  final String imageUrl, textTitle, releaseDate;
  final List<String> genreList;

  const ListTileMovieListWidget(
      {Key? key,
      required this.imageUrl,
      required this.textTitle,
      required this.genreList,
      required this.releaseDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(textTitle),
      subtitle: Row(
        children: [
          Text(
            getReleaseDateInYears(releaseDate),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            width: 5,
          ),
          Row(
            children: genreList.map((e) => Text('$e, ')).toList(),
          )
        ],
      ),
      leading: imageNetworkWidget(imageUrl),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(
            Icons.check_circle_sharp,
            size: 16,
          )
        ],
      ),
    );
  }
}

String getReleaseDateInYears(String releaseDate) =>
    DateTime.parse(releaseDate).year.toString();
