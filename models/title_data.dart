class TitleData {
  final String id;
  final String title;
  final String fulltitle;
  final String Type;
  final String Year;
  final String Image;
  final String ReleaseDate;
  final String RuntimeMins;
  final String Awards;
  final String Directors;
  final String Writers;
  final List DirectorList;
  final List WriterList;
  final String Stars;
  final List StarList;
  final List ActorList;
  final dynamic FullCast;
  final String Companies;
  final String Countries;
  final String Languages;
  final String ContentRating;
  final String IMDbRating;
  final String IMDbRatingVotes;
  final String MetacriticRating;
  final dynamic Ratings;
  final dynamic Wikipedia;
  final dynamic Posters;
  final dynamic Images;
  final dynamic Trailer;
  final dynamic TvSeriesInfo;
  final dynamic TvEpisodeInfo;
  final String ErrorMessage;
  TitleData({
    required this.id,
    required this.title,
    required this.fulltitle,
    required this.Type,
    required this.Year,
    required this.Image,
    required this.ReleaseDate,
    required this.RuntimeMins,
    required this.Awards,
    required this.Directors,
    required this.Writers,
    required this.DirectorList,
    required this.WriterList,
    required this.Stars,
    required this.StarList,
    required this.ActorList,
    required this.FullCast,
    required this.Companies,
    required this.Countries,
    required this.Languages,
    required this.ContentRating,
    required this.IMDbRating,
    required this.IMDbRatingVotes,
    required this.MetacriticRating,
    required this.Ratings,
    this.Wikipedia,
    this.Posters,
    required this.Images,
    required this.Trailer,
    required this.TvSeriesInfo,
    required this.TvEpisodeInfo,
    required this.ErrorMessage,
  });
}
