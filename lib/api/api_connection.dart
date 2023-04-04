import 'package:cinema4u/api/api_constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:cinema4u/models/tmdb/trending_movies.dart';

void main() async {
  await trendingMovies();
}

Future<List<TrendingMovies>> trendingMovies() async {
  var url = Uri.parse(ApiConstant.TMDB_API_BASE_URL +
      '/trending/movie/day' +
      ApiConstant.TMDB_API_KEY);
  var response = await http.get(url);

  if (response.statusCode == 200) {
    print('ok');
    var jsonData = jsonDecode(response.body);
    var data = await jsonData['results'];
    List<TrendingMovies> result = [];
    for (var item in data) {
      TrendingMovies trendingMovies = TrendingMovies.fromJson(item);
      result.add(trendingMovies);
    }
    return result;
  } else {
    throw Exception('no response');
  }
}
