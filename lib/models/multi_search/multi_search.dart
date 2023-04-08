class MultiSearch {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? name;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final List<int>? genreIds;
  final double? popularity;
  final String? firstAirDate;
  final double? voteAverage;
  final int? voteCount;
  final List<String>? originCountry;
  final String? title;
  final String? originalTitle;
  final String? releaseDate;
  final bool? video;
  final int? gender;
  final String? knownForDepartment;
  final String? profilePath;
  final List<KnownFor>? knownFor;

  MultiSearch(
      {required this.adult,
      this.backdropPath,
      required this.id,
      required this.name,
      required this.originalLanguage,
      required this.originalName,
      required this.overview,
      required this.posterPath,
      required this.mediaType,
      required this.genreIds,
      required this.popularity,
      required this.firstAirDate,
      required this.voteAverage,
      required this.voteCount,
      required this.originCountry,
      required this.title,
      required this.originalTitle,
      required this.releaseDate,
      required this.video,
      required this.gender,
      required this.knownForDepartment,
      required this.profilePath,
      required this.knownFor});

  factory MultiSearch.fromJson(Map<String, dynamic> json) {
    return MultiSearch(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      name: json['name'],
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      genreIds: json['genre_ids'] == null
          ? []
          : List<int>.from(json['genre_ids'].map((e) => e)),
      popularity: json['popularity'],
      firstAirDate: json['first_air_date'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      originCountry: json['origin_country'] == null
          ? []
          : List<String>.from(json['origin_country'].map((e) => e)),
      title: json['title'],
      originalTitle: json['original_title'],
      releaseDate: json['release_date'],
      video: json['video'],
      gender: json['gender'],
      knownForDepartment: json['known_for_department'],
      profilePath: json['profile_path'],
      knownFor: json['known_for'] == null
          ? []
          : List<KnownFor>.from(
              json['known_for'].map((json) => KnownFor.fromJson(json))),
    );
  }
}

class KnownFor {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final List<int>? genreIds;
  final double? popularity;
  final String? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  KnownFor(
      {required this.adult,
      required this.backdropPath,
      required this.id,
      required this.title,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.mediaType,
      required this.genreIds,
      required this.popularity,
      required this.releaseDate,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  factory KnownFor.fromJson(Map<String, dynamic> json) {
    return KnownFor(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      genreIds: json['genre_ids'] == null
          ? []
          : List<int>.from(json['genre_ids'].map((e) => e)),
      popularity: json['popularity'],
      releaseDate: json['release_date'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
