import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_popular.dart';
import 'package:movieflix/models/movie_detail.dart';

class ApiService {
  static Future<List<MoviePopular>> getPopMovies() async {
    List<MoviePopular> movieInstances = [];
    const baseUri = 'https://movies-api.nomadcoders.workers.dev/popular';

    final url = Uri.parse(baseUri);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)['results'];
      for (var movie in movies) {
        movieInstances.add(MoviePopular.fromJson(movie));
      }

      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MoviePopular>> getNowMovies() async {
    List<MoviePopular> movieInstances = [];
    const baseUri = 'https://movies-api.nomadcoders.workers.dev/now-playing';

    final url = Uri.parse(baseUri);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)['results'];
      for (var movie in movies) {
        movieInstances.add(MoviePopular.fromJson(movie));
      }

      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MoviePopular>> getComingMovies() async {
    List<MoviePopular> movieInstances = [];
    const baseUri = 'https://movies-api.nomadcoders.workers.dev/coming-soon';

    final url = Uri.parse(baseUri);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)['results'];
      for (var movie in movies) {
        movieInstances.add(MoviePopular.fromJson(movie));
      }

      return movieInstances;
    }
    throw Error();
  }

  static Future<MovieDetail> getDetailInfo(String id) async {
    const baseUri = 'https://movies-api.nomadcoders.workers.dev/movie?id=';

    final url = Uri.parse('$baseUri$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final movieInstance = MovieDetail.fromJson(json); // JSON을 MovieDetail로 변환
      return movieInstance;
    }
    throw Exception('Failed to load movie details');
  }
}
