import 'package:cinema4u/models/movies/trending_movies.dart';
import 'package:cinema4u/api/api_constant.dart';
import 'package:cinema4u/models/Genres/genres_movies.dart';
import 'package:cinema4u/models/movies/nowplaying_movies.dart';
import 'package:cinema4u/models/multi_search/multi_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

Future<List<GenresMovies>> genresMovies() async {
  var url = Uri.parse(ApiConstant.TMDB_API_BASE_URL +
      '/genre/movie/list' +
      ApiConstant.TMDB_API_KEY);
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    var data = await jsonData['genres'];
    List<GenresMovies> result = [];
    for (var item in data) {
      GenresMovies genresMovies = GenresMovies.fromJson(item);
      result.add(genresMovies);
    }
    return result;
  } else {
    throw Exception('no response');
  }
}

main() async {
  var result = await multiSearch('batman');
  print(result[0].name);
}

Future<List<MultiSearch>> multiSearch(String query) async {
  var url = Uri.parse(
      '${ApiConstant.TMDB_API_BASE_URL}/search/multi${ApiConstant.TMDB_API_KEY}&query=$query&page=1&include_adult=false');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    var data = await jsonData['results'];

    List<MultiSearch> result = [];
    for (var item in data) {
      MultiSearch multiSearch = MultiSearch.fromJson(item);
      result.add(multiSearch);
    }
    return result;
  } else {
    throw Exception('no response');
  }
}
