import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String joke;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  JokeCard({
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(joke, style: TextStyle(fontSize: 16)),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
          onPressed: onFavoriteToggle,
        ),
      ),
    );
  }
}
