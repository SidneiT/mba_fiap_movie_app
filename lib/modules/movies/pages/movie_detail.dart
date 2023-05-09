import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/movies/dto/movie_response_dto.dart';
import 'package:movie_app/utils/constants.dart';

class MovieDetail extends StatelessWidget {
  MovieDetail({Key? key}) : super(key: key);

  final MovieResponseDto selectedMovie = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(selectedMovie.title)),
        body: Container(
            constraints: const BoxConstraints.expand(),
            color: Colors.black87,
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                        child: Image.network(
                      "${Constants.baseImgUrl}${selectedMovie.backdropPath}",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[200],
                          constraints: const BoxConstraints(minHeight: 100),
                          child: Center(child: Text(selectedMovie.title))),
                    ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    Row(children: [
                      Expanded(
                          child: Text(
                        selectedMovie.title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(
                            selectedMovie.releaseDate,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          )),
                          Text(
                            selectedMovie.voteAverage.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          const Icon(Icons.star, color: Colors.white),
                        ]),
                    const SizedBox(height: 40),
                    Row(children: [
                      Expanded(
                          child: Text(
                        selectedMovie.overview,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      )),
                    ]),
                  ]),
                )
              ]),
            )));
  }
}
