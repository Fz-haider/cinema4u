class TopTvs {
  final String id;
  final String rank;
  final String title;
  final String fullTitle;
  final String year;
  final String image;
  final String crew;
  final String imDbRating;
  final String imDbRatingCount;

  TopTvs(
      {required this.id,
      required this.rank,
      required this.title,
      required this.fullTitle,
      required this.year,
      required this.image,
      required this.crew,
      required this.imDbRating,
      required this.imDbRatingCount});

  factory TopTvs.fromJson(Map<String, dynamic> json) {
    return TopTvs(
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['rank'] = rank;
    data['title'] = title;
    data['fullTitle'] = fullTitle;
    data['year'] = year;
    data['image'] = image;
    data['crew'] = crew;
    data['imDbRating'] = imDbRating;
    data['imDbRatingCount'] = imDbRatingCount;
    return data;
  }
}
