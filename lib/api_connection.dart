import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/movies/top_movies.dart';

void main() async {
  var movies = await getTopMovies();
  for (int i = 0; i < 250; i++) {
    print(movies[i].fullTitle);
  }
}

// Get Requests
Future<List<TopMovies>> getTopMovies() async {
  //you can check connection and other things here later
  var url = Uri.parse('https://imdb-api.com/en/API/Top250Movies/k_sst5oig0');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonData = await jsonDecode(response.body);
    var data = jsonData['items'];
    List<TopMovies> result = [];
    for (var item in data) {
      TopMovies obj = TopMovies.fromJson(item);
      result.add(obj);
    }

    return result;
  } else {
    throw Exception('Error!');
  }
}
