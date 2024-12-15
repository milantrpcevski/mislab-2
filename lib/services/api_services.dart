import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/joke.dart';

class ApiService {
  static const String baseUrl = "https://official-joke-api.appspot.com";

  static Future<List<String>> getJokeTypes() async {
    final response = await http.get(Uri.parse('$baseUrl/types'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return List<String>.from(data);
    } else {
      throw Exception('Failed to load joke types');
    }
  }

  static Future<List<Joke>> getJokesByType(String type) async {
    final response = await http.get(Uri.parse('$baseUrl/jokes/$type/ten'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((jokeJson) => Joke.fromJson(jokeJson)).toList();
    } else {
      throw Exception('Failed to load jokes of type $type');
    }
  }

  static Future<Joke> getRandomJoke() async {
    final response = await http.get(Uri.parse('$baseUrl/random_joke'));

    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load random joke');
    }
  }
}
