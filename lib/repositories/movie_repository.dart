import 'dart:convert';

import 'package:troca_conhecimento/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<List<MovieModel>> getMostPopularMovies() async {
    try {
      var response = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/movie/popular?api_key=f54e8290a68bc80dbcf2bdb116162051&language=pt-BR"));

      var jsonResult = jsonDecode(response.body);

      var result = List<MovieModel>.from(
          jsonResult['results'].map((e) => MovieModel.fromJson(e)));

      return result;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
