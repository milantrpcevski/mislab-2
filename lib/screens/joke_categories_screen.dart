import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';
import 'jokes_by_category_screen.dart';
import 'random_joke_screen.dart';

class JokeCategoriesScreen extends StatefulWidget {
  @override
  _JokeCategoriesScreenState createState() => _JokeCategoriesScreenState();
}

class _JokeCategoriesScreenState extends State<JokeCategoriesScreen> {
  late Future<List<String>> jokeTypes;

  @override
  void initState() {
    super.initState();
    jokeTypes = ApiService.getJokeTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joke Categories"),
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RandomJokeScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: jokeTypes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return ListView(
              children: snapshot.data!
                  .map((type) => JokeCard(
                title: type,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JokesByCategoryScreen(type: type),
                    ),
                  );
                },
              ))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}
