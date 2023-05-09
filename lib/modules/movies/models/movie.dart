class Movie {
  String posterPath;
  bool adult;
  String overview;
  String releaseDate;
  List<int> genreIds;
  int id;
  String originalTitle;
  String originalLanguage;
  String title;
  String backdropPath;
  double popularity;
  int voteCount;
  bool video;
  double voteAverage;

  Movie({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      posterPath: map['poster_path'] ?? "",
      adult: map['adult'],
      overview: map['overview'] ?? "",
      releaseDate: map['release_date'] ?? "",
      genreIds: List<int>.from(map['genre_ids']),
      id: map['id'],
      originalTitle: map['original_title'] ?? "",
      originalLanguage: map['original_language'] ?? "",
      title: map['title'] ?? "",
      backdropPath: map['backdrop_path'] ?? "",
      popularity: double.parse(map['popularity'].toString()),
      voteCount: map['vote_count'],
      video: map['video'],
      voteAverage: double.parse(map['vote_average'].toString()),
    );
  }
}
