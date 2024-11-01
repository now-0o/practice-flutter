class MovieDetail {
  final String id;
  final String originalTitle;
  final String overview;
  final double vote;
  final int runtime;
  final List<Genre> genres;

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        originalTitle = json['original_title'],
        overview = json['overview'],
        vote = json['vote_average'].toDouble(),
        runtime = json['runtime'],
        genres = (json['genres'] as List)
            .map((genre) => Genre.fromJson(genre))
            .toList();
}

class Genre {
  final int id;
  final String name;

  Genre.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
