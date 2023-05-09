import 'package:movie_app/infraestructure/api.dart';
import 'package:movie_app/modules/movies/models/movie.dart';
import 'package:movie_app/modules/movies/services/movies_service.dart';

class MoviesServiceImpl implements MovieService {
  int _page = 1;
  int _totalPage = 0;
  Api api;

  MoviesServiceImpl({required this.api});

  @override
  Future<List<Movie>> getMovies({int page = 1}) {
    _page = page;
    return _doRequest();
  }

  @override
  Future<List<Movie>> getNextPageMovies() {
    if ((_page + 1) <= _totalPage) {
      return getMovies(page: _page + 1);
    }

    return Future.sync(() => []);
  }

  Future<List<Movie>> _doRequest() async {
    String endpoint = '/3/discover/movie';

    try {
      var data = await api.get(
          endpoint, {'page': _page.toString(), 'sort_by': 'popularity.desc'});

      _totalPage = data['total_pages'];

      var list = List<Movie>.from(
          data['results'].map((objMap) => Movie.fromMap(objMap)));

      return Future.sync(() => list);
    } catch (error) {
      return Future.error(error);
    }
  }
}
