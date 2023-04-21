class TvDetail {
  final bool adult;
  final String backdropPath;
  final List<int> episodeRunTime;
  final String firstAirDate;
  final List<Genres>? genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final String lastAirDate;
  final LastEpisodeToAir lastEpisodeToAir;
  final String name;
  final List<Networks> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompanies> productionCompanies;
  final List<ProductionCountries> productionCountries;
  final List<Seasons> seasons;
  final List<SpokenLanguages> spokenLanguages;
  final String status;
  final String tagline;
  final String type;
  final int voteAverage;
  final int voteCount;

  TvDetail(
      {required this.adult,
      required this.backdropPath,
      required this.episodeRunTime,
      required this.firstAirDate,
      required this.genres,
      required this.homepage,
      required this.id,
      required this.inProduction,
      required this.languages,
      required this.lastAirDate,
      required this.lastEpisodeToAir,
      required this.name,
      required this.networks,
      required this.numberOfEpisodes,
      required this.numberOfSeasons,
      required this.originCountry,
      required this.originalLanguage,
      required this.originalName,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.productionCompanies,
      required this.productionCountries,
      required this.seasons,
      required this.spokenLanguages,
      required this.status,
      required this.tagline,
      required this.type,
      required this.voteAverage,
      required this.voteCount});

  factory TvDetail.fromJson(Map<String, dynamic> json) {
    return TvDetail(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      episodeRunTime: json['episode_run_time'].cast<int>(),
      firstAirDate: json['first_air_date'],
      genres: json['genres'] == null
          ? []
          : List<Genres>.from(
              json['genres'].map((json) => Genres.fromJson(json))),
      homepage: json['homepage'],
      id: json['id'],
      inProduction: json['in_production'],
      languages: json['languages'].cast<String>(),
      lastAirDate: json['last_air_date'],
      lastEpisodeToAir: LastEpisodeToAir.fromJson(json['last_episode_to_air']),
      name: json['name'],
      networks: List<Networks>.from(
          json['networks'].map((e) => Networks.fromJson(e))),
      numberOfEpisodes: json['number_of_episodes'],
      numberOfSeasons: json['number_of_seasons'],
      originCountry: json['origin_country'].cast<String>(),
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies: List<ProductionCompanies>.from(
          json['production_companies']
              .map((e) => ProductionCompanies.fromJson(e))),
      productionCountries: List<ProductionCountries>.from(
          json['production_countries']
              .map((e) => ProductionCountries.fromJson(e))),
      seasons:
          List<Seasons>.from(json['seasons'].map((e) => Seasons.fromJson(e))),
      spokenLanguages: List<SpokenLanguages>.from(
          json['spoken_languages'].map((e) => SpokenLanguages.fromJson(e))),
      status: json['status'],
      tagline: json['tagline'],
      type: json['type'],
      voteAverage: json['vote_average'].toInt(),
      voteCount: json['vote_count'].toInt(),
    );
  }
}

class Genres {
  int? id;
  String? name;

  Genres({required this.id, required this.name});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      id: json['id'],
      name: json['name'],
    );
  }
}

class LastEpisodeToAir {
  int? id;
  String? name;
  String? overview;
  int? voteAverage;
  int? voteCount;
  String? airDate;
  int? episodeNumber;
  String? productionCode;

  int? seasonNumber;
  int? showId;

  LastEpisodeToAir({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.productionCode,
    required this.seasonNumber,
    required this.showId,
  });

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    return LastEpisodeToAir(
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      voteAverage: json['vote_average'].toInt(),
      voteCount: json['vote_count'].toInt(),
      airDate: json['air_date'],
      episodeNumber: json['episode_number'],
      productionCode: json['production_code'],
      seasonNumber: json['season_number'],
      showId: json['show_id'],
    );
  }
}

class Networks {
  int id;
  String? logoPath;
  String? name;
  String? originCountry;

  Networks(
      {required this.id,
      required this.logoPath,
      required this.name,
      required this.originCountry});

  factory Networks.fromJson(Map<String, dynamic> json) {
    return Networks(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }
}

class ProductionCompanies {
  final int? id;
  final String? logoPath;
  final String name;
  final String? originCountry;

  ProductionCompanies(
      {required this.id,
      required this.logoPath,
      required this.name,
      required this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) {
    return ProductionCompanies(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({required this.iso31661, required this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) {
    return ProductionCountries(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }
}

class Seasons {
  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  String? posterPath;
  int? seasonNumber;

  Seasons(
      {required this.airDate,
      required this.episodeCount,
      required this.id,
      required this.name,
      required this.overview,
      required this.posterPath,
      required this.seasonNumber});

  factory Seasons.fromJson(Map<String, dynamic> json) {
    return Seasons(
      airDate: json['air_date'],
      episodeCount: json['episode_count'],
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      seasonNumber: json['season_number'],
    );
  }
}

class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages(
      {required this.englishName, required this.iso6391, required this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) {
    return SpokenLanguages(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }
}
