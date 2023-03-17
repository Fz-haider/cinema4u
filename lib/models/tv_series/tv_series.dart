import 'package:cinema4u/models/tv_series/episodes.dart';

class TvSeries {
  final String imDbId;
  final String title;
  final String fullTitle;
  final String type;
  final String year;
  final List<Episodes> episodes;

  TvSeries({
    required this.imDbId,
    required this.title,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.episodes,
  });

  factory TvSeries.fromJson(Map<String, dynamic> json) {
    return TvSeries(
      imDbId: json['imDbId'],
      title: json['title'],
      fullTitle: json['fullTitle'],
      type: json['type'],
      year: json['year'],
      episodes: <Episodes>[],
    );
  }
}
