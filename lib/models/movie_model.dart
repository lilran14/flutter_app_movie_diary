class MovieModel {
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String posterPath;
  final String? backdropPath;
  final List<int>? listGenre;
  MovieModel({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.posterPath,
    this.backdropPath,
    this.listGenre,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      title: json['title'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath:
          json.containsKey('backdrop_path') ? json['backdrop_path'] : null,
      listGenre: json.containsKey('genre_ids')
          ? List<int>.from(json["genre_ids"].map((x) => x))
          : null);

  String getGenreName(int id) {
    switch (id) {
      case 28:
        return "Action";
      case 12:
        return "Adventure";
      case 16:
        return "Animation";
      case 35:
        return "Comedy";
      case 80:
        return "Crime";
      case 99:
        return "Documentary";
      case 18:
        return "Drama";
      case 10751:
        return "Family";
      case 14:
        return "Fantasy";
      case 36:
        return "History";
      case 27:
        return "Horror";
      case 10402:
        return "Music";
      case 9648:
        return "Mystery";
      case 10749:
        return "Romance";
      case 878:
        return "Science Fiction";
      case 10770:
        return "TV Movie";
      case 53:
        return "Thriller";
      case 10752:
        return "War";
      case 37:
        return "Western";
      default:
        return "Unknown Genre";
    }
  }
}
