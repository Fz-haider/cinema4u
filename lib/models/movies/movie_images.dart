class MovieImages {
  final List<Backdrops>? backdrops;
  final int? id;
  final List<Logos>? logos;
  final List<Posters>? posters;

  MovieImages(
      {required this.backdrops,
      required this.id,
      required this.logos,
      required this.posters});

  factory MovieImages.fromJson(Map<String, dynamic> json) {
    return MovieImages(
      backdrops: List<Backdrops>.from(List<dynamic>.from(json['backdrops'])
          .map((backdrop) => Backdrops.fromJson(backdrop))),
      id: json['id'],
      logos: List<Logos>.from(List<dynamic>.from(json['logos'])
          .map((logo) => Logos.fromJson(logo))),
      posters: List<Posters>.from(List<dynamic>.from(json['posters'])
          .map((poster) => Posters.fromJson(poster))),
    );
  }
}

class Backdrops {
  final double aspectRatio;
  final int height;
  final String? iso6391;
  final String? filePath;
  final double voteAverage;
  final double voteCount;
  final double width;

  Backdrops(
      {required this.aspectRatio,
      required this.height,
      this.iso6391,
      this.filePath,
      required this.voteAverage,
      required this.voteCount,
      required this.width});

  factory Backdrops.fromJson(Map<String, dynamic> json) {
    return Backdrops(
      aspectRatio: json['aspect_ratio'],
      height: json['height'],
      iso6391: json['iso_639_1'],
      filePath: json['file_path'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'].toDouble(),
      width: json['width'].toDouble(),
    );
  }
}

class Logos {
  final double aspectRatio;
  final int height;
  final String? iso6391;
  final String filePath;
  final double voteAverage;
  final double voteCount;
  final double width;

  Logos(
      {required this.aspectRatio,
      required this.height,
      required this.iso6391,
      required this.filePath,
      required this.voteAverage,
      required this.voteCount,
      required this.width});

  factory Logos.fromJson(Map<String, dynamic> json) {
    return Logos(
      aspectRatio: json['aspect_ratio'],
      height: json['height'],
      iso6391: json['iso_639_1'],
      filePath: json['file_path'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'].toDouble(),
      width: json['width'].toDouble(),
    );
  }
}

class Posters {
  final double aspectRatio;
  final int height;
  final String? iso6391;
  final String filePath;
  final double voteAverage;
  final double voteCount;
  final double width;

  Posters(
      {required this.aspectRatio,
      required this.height,
      this.iso6391,
      required this.filePath,
      required this.voteAverage,
      required this.voteCount,
      required this.width});

  factory Posters.fromJson(Map<String, dynamic> json) {
    return Posters(
      aspectRatio: json['aspect_ratio'],
      height: json['height'],
      iso6391: json['iso_639_1'],
      filePath: json['file_path'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'].toDouble(),
      width: json['width'].toDouble(),
    );
  }
}
