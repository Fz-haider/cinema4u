import 'package:cinema4u/models/discover/discover_genres.dart';
import 'package:cinema4u/models/movies/movie_detail.dart';
import 'package:cinema4u/models/movies/movie_images.dart';
import 'package:cinema4u/models/movies/movie_trailer.dart';
import 'package:cinema4u/models/movies/movie_trailer.dart';
import 'package:cinema4u/models/movies/trending_movies.dart';
import 'package:cinema4u/api/api_constant.dart';
import 'package:cinema4u/models/Genres/genres_movies.dart';
import 'package:cinema4u/models/movies/nowplaying_movies.dart';
import 'package:cinema4u/models/multi_search/multi_search.dart';
import 'package:cinema4u/models/tv/popular_tv.dart';
import 'package:cinema4u/models/tv/tv_detail.dart';
import 'package:cinema4u/models/tv/tv_trailer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<TrendingMovies>> trendingMovies() async {
  var url = Uri.parse(
      '${ApiConstant.TMDB_API_BASE_URL}/trending/movie/day${ApiConstant.TMDB_API_KEY}');
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
  var url = Uri.parse(
      '${ApiConstant.TMDB_API_BASE_URL}/movie/now_playing${ApiConstant.TMDB_API_KEY}');
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

Future<List<PopularTv>> popularTv() async {
  var url = Uri.parse(
      '${ApiConstant.TMDB_API_BASE_URL}/tv/popular${ApiConstant.TMDB_API_KEY}');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    var data = await jsonData['results'];
    List<PopularTv> result = [];
    for (var item in data) {
      PopularTv popularTv = PopularTv.fromJson(item);
      result.add(popularTv);
    }
    return result;
  } else {
    throw Exception('no response');
  }
}

Future<List<GenresMovies>> genresMovies() async {
  var url = Uri.parse(
      '${ApiConstant.TMDB_API_BASE_URL}/genre/movie/list${ApiConstant.TMDB_API_KEY}');
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

Future<MovieDetail> movieDetail(int id) async {
  var url = Uri.parse(
      '${ApiConstant.TMDB_API_BASE_URL}/movie/$id${ApiConstant.TMDB_API_KEY}&language=en-US');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);

    MovieDetail movieDetail = MovieDetail.fromJson(jsonData);

    return movieDetail;
  } else {
    throw Exception('no response');
  }
}

Future<List<MovieImages>> movieImages(int id) async {
  var url = Uri.parse(
      '${ApiConstant.TMDB_API_BASE_URL}/movie/$id/images${ApiConstant.TMDB_API_KEY}');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    var data = await jsonData['backdrops'];
    List<MovieImages> result = [];
    for (var item in data) {
      MovieImages movieImages = MovieImages.fromJson(item);
      result.add(movieImages);
    }
    return result;
  } else {
    throw Exception('no response');
  }
}

Future<List<MovieTrailer>> movieTrailer(int id) async {
  var url = Uri.parse(
      '${ApiConstant.TMDB_API_BASE_URL}/movie/$id/videos${ApiConstant.TMDB_API_KEY}&language=en-US');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    var data = await jsonData['results'];
    List<MovieTrailer> result = [];
    for (var item in data) {
      MovieTrailer movieTrailer = MovieTrailer.fromJson(item);
      result.add(movieTrailer);
    }
    return result;
  } else {
    throw Exception('no response');
  }
}

Future<TvDetail> tvDetail(int id) async {
  var url = Uri.parse(
      '${ApiConstant.TMDB_API_BASE_URL}/tv/$id${ApiConstant.TMDB_API_KEY}&language=en-US');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);

    TvDetail tvDetail = TvDetail.fromJson(jsonData);

    return tvDetail;
  } else {
    throw Exception('no response');
  }
}

Future<List<TvTrailer>> tvTrailer(int id) async {
  var url = Uri.parse(
      '${ApiConstant.TMDB_API_BASE_URL}/tv/$id/videos${ApiConstant.TMDB_API_KEY}&language=en-US');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    var data = await jsonData['results'];
    List<TvTrailer> result = [];
    for (var item in data) {
      TvTrailer tvTrailer = TvTrailer.fromJson(item);
      result.add(tvTrailer);
    }
    return result;
  } else {
    throw Exception('no response');
  }
}

Future<List<DiscoverByGenres>> discoverByGenres(int id) async {
  var url = Uri.parse(
      '${ApiConstant.TMDB_API_BASE_URL}/discover/movie${ApiConstant.TMDB_API_KEY}&with_genres=$id');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    var data = await jsonData['results'];
    List<DiscoverByGenres> result = [];
    for (var item in data) {
      DiscoverByGenres movieTrailer = DiscoverByGenres.fromJson(item);
      result.add(movieTrailer);
    }
    return result;
  } else {
    throw Exception('no response');
  }
}
