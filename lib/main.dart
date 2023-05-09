import 'package:flutter/material.dart';
//Adicionamos o import do get
import 'package:get/get.dart';
import 'package:movie_app/modules/movies/pages/movie_detail.dart';
import 'package:movie_app/modules/movies/pages/movie_gallery.dart';
import 'package:movie_app/modules/movies/pages/movie_gallery_bind.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sugestões de Filmes',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: "/",
            page: () => MovieGallery(),
            binding: MovieGalleryBinding()),
        GetPage(name: "/detail", page: () => MovieDetail()),
      ],
    );
  }
}
