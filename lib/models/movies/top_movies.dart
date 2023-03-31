class TopMovies {
  final String id;
  final String rank;
  final String title;
  final String fullTitle;
  final String year;
  final String image;
  final String crew;
  final String imDbRating;
  final String imDbRatingCount;

  TopMovies(
      {required this.id,
      required this.rank,
      required this.title,
      required this.fullTitle,
      required this.year,
      required this.image,
      required this.crew,
      required this.imDbRating,
      required this.imDbRatingCount});

  factory TopMovies.fromJson(Map<String, dynamic> json) {
    return TopMovies(
      id: json['id'],
      rank: json['rank'],
      title: json['title'],
      fullTitle: json['fullTitle'],
      year: json['year'],
      image: json['image'],
      crew: json['crew'],
      imDbRating: json['imDbRating'],
      imDbRatingCount: json['imDbRatingCount'],
    );
  }
}
