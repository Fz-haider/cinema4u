class GenresMovies {
  final int id;
  final String name;
  bool active;

  GenresMovies({required this.id, required this.name, this.active = false});

  factory GenresMovies.fromJson(Map<String, dynamic> json) {
    return GenresMovies(
      id: json['id'],
      name: json['name'],
    );
  }
  void toggleActive() {
    active = !active;
  }
}
