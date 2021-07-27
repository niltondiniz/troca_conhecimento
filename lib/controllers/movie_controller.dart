import 'package:troca_conhecimento/models/movie_model.dart';
import 'package:troca_conhecimento/repositories/movie_repository.dart';

class MovieController {
  MovieRepository repository = MovieRepository();
  List<MovieModel> moviesList = [];

  Future<void> getMostPopularMovies() async {
    try {
      moviesList = await repository.getMostPopularMovies();
    } catch (e) {
      throw e;
    }
  }
}
