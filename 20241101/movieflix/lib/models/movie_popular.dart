class MoviePopular {
  final String backdropPath, posterPath, id, originalTitle;

  MoviePopular.fromJson(Map<String, dynamic> json)
      : backdropPath = json['backdrop_path'],
        posterPath = json['poster_path'],
        id = json['id'].toString(),
        originalTitle = json['original_title'];
}
