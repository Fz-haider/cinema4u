class GenresMovies {
  final int id;
  final String name;

  GenresMovies({required this.id, required this.name});

  factory GenresMovies.fromJson(Map<String, dynamic> json) {
    return GenresMovies(
      id: json['id'],
      name: json['name'],
    );
  }
}
