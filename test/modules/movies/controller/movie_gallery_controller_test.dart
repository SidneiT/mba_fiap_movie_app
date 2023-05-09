import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/modules/movies/controllers/movie_gallery_controller.dart';
import 'package:movie_app/modules/movies/models/movie.dart';
import 'package:movie_app/modules/movies/services/movies_service.dart';

import 'movie_gallery_controller_test.mocks.dart';

@GenerateMocks([MovieService])
void main() {
  late MockMovieService service;
  late List<Movie> listMovies;

  setUp(() {
    service = MockMovieService();

    var json =
        File("${Directory.current.path}/test/resources/movie_model_api.json")
            .readAsStringSync();

    listMovies = [
      Movie.fromMap(jsonDecode(json)),
      Movie.fromMap(jsonDecode(json))
    ];

    when(service.getMovies())
        .thenAnswer((_) async => Future.sync(() => listMovies));

    when(service.getNextPageMovies())
        .thenAnswer((_) async => Future.sync(() => listMovies));
  });

  test("Validando controller e paginação", () async {
    final controller = MovieGalleryController(service);

    Get.put(controller);

    expect(controller.loading, isTrue);

    await untilCalled(service.getMovies());

    verify(service.getMovies()).called(1);

    expect(controller.list.length, 2);

    expect(controller.loading, isFalse);

    expect(controller.list[0].id, listMovies[0].id);
    expect(controller.list[0].backdropPath, listMovies[0].backdropPath);
    expect(controller.list[0].overview, listMovies[0].overview);
    expect(controller.list[0].posterPath, listMovies[0].posterPath);
    expect(controller.list[0].title, listMovies[0].title);
    expect(controller.list[0].releaseDate, listMovies[0].releaseDate);
    expect(controller.list[0].voteAverage, listMovies[0].voteAverage);

    controller.nextPage();

    await untilCalled(service.getNextPageMovies());

    verify(service.getNextPageMovies()).called(1);

    expect(controller.list.length, 4);
    expect(controller.loading, isFalse);
  });
}
