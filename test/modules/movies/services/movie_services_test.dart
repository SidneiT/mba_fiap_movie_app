import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/infraestructure/api.dart';
import 'package:movie_app/modules/movies/services/movies_service.dart';
import 'package:movie_app/modules/movies/services/movies_service_impl.dart';

import 'movie_services_test.mocks.dart';

@GenerateMocks([Api])
void main() {
  late MockApi api;
  late MovieService service;
  late String responseJson;

  setUp(() {
    api = MockApi();

    service = MoviesServiceImpl(api: api);

    responseJson =
        File("${Directory.current.path}/test/resources/movies_api.json")
            .readAsStringSync();
  });

  test("Validando parser e simulando retorno da API", () async {
    when(api.get(any, any))
        .thenAnswer((_) async => Future.sync(() => jsonDecode(responseJson)));

    var response = await service.getMovies();

    expect(response.length, 20);

    expect(response[0].id, equals(580489));

    var responsePagitation = await service.getNextPageMovies();

    expect(responsePagitation.length, 20);

    verify(api.get(any, any)).called(2);
  });
}
