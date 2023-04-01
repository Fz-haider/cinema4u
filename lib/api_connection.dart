import 'package:cinema4u/models/imdbList/imdb_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cinema4u/api_constant.dart';

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
  var url = Uri.parse('${ApiConstant.url}/Top250Movies/${ApiConstant.key}/');
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

Future<List<ImdbList>> getImdbList() async {
  //you can check connection and other things here later
  var url =
      Uri.parse('${ApiConstant.url}/IMDbList/${ApiConstant.key}/ls004285275');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonData = await jsonDecode(response.body);
    var data = jsonData['items'];
    List<ImdbList> result = [];
    for (var item in data) {
      ImdbList obj = ImdbList.fromJson(item);
      result.add(obj);
    }

    return result;
  } else {
    throw Exception('Error!');
  }
}
