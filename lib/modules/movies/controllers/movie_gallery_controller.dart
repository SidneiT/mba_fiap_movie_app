import 'package:get/state_manager.dart';
import 'package:movie_app/modules/movies/dto/movie_response_dto.dart';
import 'package:movie_app/modules/movies/models/movie.dart';
import 'package:movie_app/modules/movies/services/movies_service.dart';

class MovieGalleryController extends GetxController {
  final _list = <MovieResponseDto>[].obs;

  final _loading = false.obs;

  final MovieService _service;

  List<MovieResponseDto> get list => _list.toList();

  bool get loading => _loading.value;

  MovieGalleryController(this._service);

  @override
  void onInit() {
    _initialLoadMovies();
    super.onInit();
  }

  void _initialLoadMovies() {
    if (loading) {
      return;
    }

    _loading.value = true;

    _service.getMovies().then((value) {
      _updateList(value);
    });
  }

  void _updateList(List<Movie> value) {
    var tempList = value
        .map<MovieResponseDto>((e) => MovieResponseDto(e.id, e.posterPath,
            e.overview, e.releaseDate, e.title, e.backdropPath, e.voteAverage))
        .toList();

    _list.addAll(tempList);
    _loading.value = false;
  }

  void nextPage() {
    if (loading) {
      return;
    }

    _loading.value = true;
    _service.getNextPageMovies().then((value) {
      _updateList(value);
    });
  }
}
