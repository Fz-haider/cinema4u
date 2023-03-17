import 'package:cinema4u/api_connection.dart' as api;
import 'package:flutter/foundation.dart';

void main(List<String> args) {
  print("");
}

class Title {
  final String id;
  final String title;
  final String fulltitle;
  final String type;
  final String year;
  final String image;
  final String releaseDate;
  final String runtimeMins;
  final String awards;
  final String directors;
  final String writers;
  final List directorList;
  final List writerList;
  final String stars;
  final List starList;
  final List actorList;
  final dynamic fullCast;
  final String companies;
  final String countries;
  final String languages;
  final String contentRating;
  final String iMDbRating;
  final String iMDbRatingVotes;
  final String metacriticRating;
  final dynamic ratings;
  final dynamic wikipedia;
  final dynamic posters;
  final dynamic images;
  final dynamic trailer;
  final dynamic tvSeriesInfo;
  final dynamic tvEpisodeInfo;
  final String errorMessage;

  Title({
    required this.id,
    required this.title,
    required this.fulltitle,
    required this.type,
    required this.year,
    required this.image,
    required this.releaseDate,
    required this.runtimeMins,
    required this.awards,
    required this.directors,
    required this.writers,
    required this.directorList,
    required this.writerList,
    required this.stars,
    required this.starList,
    required this.actorList,
    required this.fullCast,
    required this.companies,
    required this.countries,
    required this.languages,
    required this.contentRating,
    required this.iMDbRating,
    required this.iMDbRatingVotes,
    required this.metacriticRating,
    this.ratings,
    this.wikipedia,
    this.posters,
    this.images,
    this.trailer,
    this.tvSeriesInfo,
    this.tvEpisodeInfo,
    required this.errorMessage,
  });

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      id: json['id'],
      title: json['title'],
      fulltitle: json['fulltitle'],
      type: json['type'],
      year: json['year'],
      image: json['image'],
      releaseDate: json['releaseDate'],
      runtimeMins: json['runtimeMins'],
      awards: json['awards'],
      directors: json['directors'],
      writers: json['writers'],
      directorList: json['directorList'],
      writerList: json['writerList'],
      stars: json['stars'],
      starList: json['starList'],
      actorList: json['actorList'],
      fullCast: json['fullCast'],
      companies: json['companies'],
      countries: json['countries'],
      languages: json['languages'],
      contentRating: json['contentRating'],
      iMDbRating: json['iMDbRating'],
      iMDbRatingVotes: json['iMDbRatingVotes'],
      metacriticRating: json['metacriticRating'],
      ratings: json['ratings'],
      wikipedia: json['wikipedia'],
      posters: json['posters'],
      images: json['images'],
      trailer: json['trailer'],
      tvSeriesInfo: json['tvSeriesInfo'],
      tvEpisodeInfo: json['tvEpisodeInfo'],
      errorMessage: json['errorMessage'],
    );
  }
}
