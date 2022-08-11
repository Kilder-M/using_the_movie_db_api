import 'package:flutter/material.dart';

class ListTileMovieTitle extends StatelessWidget {
  final String? title;
  final bool isTap;
  final void Function()? onTapFavoriteIcon;
  const ListTileMovieTitle(
      {Key? key, this.title, this.onTapFavoriteIcon, this.isTap = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: GestureDetector(
        onTap: onTapFavoriteIcon,
        child: Icon(
          isTap ? Icons.favorite : Icons.favorite_border_outlined,
        ),
      ),
      title: Text(
        title ?? '',
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
