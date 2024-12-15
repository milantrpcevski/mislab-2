import 'package:flutter/material.dart';
import '../model/joke.dart';
import '../services/api_services.dart';

class JokesByCategoryScreen extends StatelessWidget {
  final String type;

  JokesByCategoryScreen({required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$type Jokes"),
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiService.getJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return ListView(
              children: snapshot.data!
                  .map((joke) => ListTile(
                title: Text(joke.setup),
                subtitle: Text(joke.punchline),
              ))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}
