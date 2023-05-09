import 'package:movie_app/modules/movies/models/movie.dart';

abstract class MovieService {
  Future<List<Movie>> getMovies({int page = 1});

  Future<List<Movie>> getNextPageMovies();
}
