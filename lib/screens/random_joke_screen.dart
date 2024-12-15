import 'package:flutter/material.dart';
import '../model/joke.dart';
import '../services/api_services.dart';

class RandomJokeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Joke of the Day"),
      ),
      body: FutureBuilder<Joke>(
        future: ApiService.getRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.setup,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(snapshot.data!.punchline,
                      style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
