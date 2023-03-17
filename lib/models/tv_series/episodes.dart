class Episodes {
  final String id;
  final String seasonNumber;
  final String episodeNumber;
  final String title;
  final String image;
  final String year;
  final String released;
  final String plot;
  final String imDbRating;
  final String imDbRatingCount;

  Episodes(
      {required this.id,
      required this.seasonNumber,
      required this.episodeNumber,
      required this.title,
      required this.image,
      required this.year,
      required this.released,
      required this.plot,
      required this.imDbRating,
      required this.imDbRatingCount});

  factory Episodes.fromJson(Map<String, dynamic> json) {
    return Episodes(
      id: json['id'],
      seasonNumber: json['seasonNumber'],
      episodeNumber: json['episodeNumber'],
      title: json['title'],
      image: json['image'],
      year: json['year'],
      released: json['released'],
      plot: json['plot'],
      imDbRating: json['imDbRating'],
      imDbRatingCount: json['imDbRatingCount'],
    );
  }
}
