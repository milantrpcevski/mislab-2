import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';
import 'favorite_joke_screen.dart';

class JokesScreen extends StatefulWidget {
  final String category;

  JokesScreen({required this.category});

  @override
  _JokesScreenState createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  List<String> jokes = [];
  Set<String> favoriteJokes = {};

  @override
  void initState() {
    super.initState();
    fetchJokes();
  }

  void fetchJokes() async {
    try {
      final fetchedJokes = await ApiService.getJokesByType(widget.category);
      setState(() {
        jokes = fetchedJokes.map((j) => j.setup + " - " + j.punchline).toList();
      });
    } catch (e) {
      print("Failed to fetch jokes: $e");
    }
  }

  void toggleFavorite(String joke) {
    setState(() {
      if (favoriteJokes.contains(joke)) {
        favoriteJokes.remove(joke);
      } else {
        favoriteJokes.add(joke);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.category} Jokes"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteJokesScreen(
                    favoriteJokes: favoriteJokes.toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          return JokeCard(
            joke: joke,
            isFavorite: favoriteJokes.contains(joke),
            onFavoriteToggle: () => toggleFavorite(joke),
          );
        },
      ),
    );
  }
}
