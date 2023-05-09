import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/modules/movies/models/movie.dart';

void main() {
  late String responseJson;

  setUp(() {
    responseJson =
        File("${Directory.current.path}/test/resources/movie_model_api.json")
            .readAsStringSync();
  });

  test("Verificando se carregou o json", () {
    expect(responseJson, isNotNull);

    expect(responseJson.length, greaterThan(100));
  });

  test("Verificando o parser do json na criação do objeto", () async {
    Movie movie = Movie.fromMap(jsonDecode(responseJson));

    expect(movie, isNotNull);

    expect(movie.id, equals(580489));
    expect(movie.title, equals("Venom: Let There Be Carnage"));
    expect(movie.posterPath, equals("/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg"));
    expect(
        movie.overview,
        equals(
            "After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady."));

    expect(movie.voteAverage, equals(7.2));
  });
}
