import 'package:troca_conhecimento/models/movie_model.dart';
import 'package:troca_conhecimento/repositories/movie_repository.dart';

class MovieController {
  final MovieRepository repository;

  MovieController(this.repository);

  Future<List<MovieModel>> getMostPopularMovies() async {
    try {
      return await repository.getMostPopularMovies();
    } catch (e) {
      throw e;
    }
  }
}
