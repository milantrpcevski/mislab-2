import 'package:flutter/material.dart';
import 'package:mislab/screens/random_joke_screen.dart';

class JokeCategoriesScreen extends StatelessWidget {
  final List<String> categories = ["general", "knock-knock", "programming", "dad"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joke Categories"),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(category, style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JokesScreen(category: category),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
