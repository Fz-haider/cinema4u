class MovieImages {
  final Backdrops? backdrops;
  final int? id;
  final Logos? logos;
  final Posters? posters;

  MovieImages(
      {required this.backdrops,
      required this.id,
      required this.logos,
      required this.posters});

  factory MovieImages.fromJson(Map<String, dynamic> json) {
    return MovieImages(
      backdrops: json['backdrops'],
      id: json['id'],
      logos: json['logos'],
      posters: json['posters'],
    );
  }
}

class Backdrops {
  final double aspectRatio;
  final int height;
  final String iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  Backdrops(
      {required this.aspectRatio,
      required this.height,
      required this.iso6391,
      required this.filePath,
      required this.voteAverage,
      required this.voteCount,
      required this.width});

  factory Backdrops.fromJson(Map<String, dynamic> json) {
    return Backdrops(
      aspectRatio: json['aspect_ratio'],
      height: json['height'],
      iso6391: json['iso_639_1'],
      filePath: json['file_path'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      width: json['width'],
    );
  }
}

class Logos {
  final double aspectRatio;
  final int height;
  final String iso6391;
  final String filePath;
  final int voteAverage;
  final int voteCount;
  final int width;

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
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      width: json['width'],
    );
  }
}

class Posters {
  final double aspectRatio;
  final int height;
  final String iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  Posters(
      {required this.aspectRatio,
      required this.height,
      required this.iso6391,
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
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      width: json['width'],
    );
  }
}
