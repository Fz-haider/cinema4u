import 'package:cinema4u/api/api_constant.dart';
import 'package:cinema4u/models/movies/nowplaying_movies.dart';
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

Future<List<NowPlayingMovies>> nowplayingMovies() async {
  var url = Uri.parse(ApiConstant.TMDB_API_BASE_URL +
      '/movie/now_playing' +
      ApiConstant.TMDB_API_KEY);
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    var data = await jsonData['results'];
    List<NowPlayingMovies> result = [];
    for (var item in data) {
      NowPlayingMovies nowplayingMovies = NowPlayingMovies.fromJson(item);
      result.add(nowplayingMovies);
    }
    return result;
  } else {
    throw Exception('no response');
  }
}
