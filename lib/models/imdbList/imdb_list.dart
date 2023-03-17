class ImdbList {
  final String id;
  final String index;
  final String title;
  final String fullTitle;
  final String year;
  final String image;
  final String imDbRating;
  final String imDbRatingCount;
  final String description;

  ImdbList(
      {required this.id,
      required this.index,
      required this.title,
      required this.fullTitle,
      required this.year,
      required this.image,
      required this.imDbRating,
      required this.imDbRatingCount,
      required this.description});

  factory ImdbList.fromJson(Map<String, dynamic> json) {
    return ImdbList(
      id: json['id'],
      index: json['index'],
      title: json['title'],
      fullTitle: json['fullTitle'],
      year: json['year'],
      image: json['image'],
      imDbRating: json['imDbRating'],
      imDbRatingCount: json['imDbRatingCount'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['index'] = index;
    data['title'] = title;
    data['fullTitle'] = fullTitle;
    data['year'] = year;
    data['image'] = image;
    data['imDbRating'] = imDbRating;
    data['imDbRatingCount'] = imDbRatingCount;
    data['description'] = description;
    return data;
  }
}
