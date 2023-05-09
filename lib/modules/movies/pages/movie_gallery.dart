import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movie_app/modules/movies/controllers/movie_gallery_controller.dart';
import 'package:movie_app/modules/movies/dto/movie_response_dto.dart';
import 'package:movie_app/modules/movies/pages/movie_detail.dart';
import 'package:movie_app/utils/constants.dart';

class MovieGallery extends StatelessWidget {
  MovieGallery({Key? key}) : super(key: key);

  final MovieGalleryController controller = Get.find<MovieGalleryController>();

  Widget _moviesGrid(BuildContext context) {
    return LazyLoadScrollView(
      onEndOfPage: () => controller.nextPage(),
      isLoading: controller.loading,
      child: GridView.builder(
          itemCount: controller.list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.66),
          itemBuilder: (BuildContext ctx, index) {
            return _buildGridTileList(ctx, controller.list[index]);
          }),
    );
  }

  InkWell _buildGridTileList(
      BuildContext context, MovieResponseDto movieResponseDto) {
    return InkWell(
        child: Image.network(
          "${Constants.baseImgUrl}${movieResponseDto.posterPath}",
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey[200],
            child: Center(child: Text(movieResponseDto.title)),
          ),
        ),
        onTap: () => _openDetailPage(context, movieResponseDto));
  }

  _openDetailPage(BuildContext context, MovieResponseDto movieResponseDto) {
    Get.replace(movieResponseDto);
    Get.toNamed("/detail");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Filmes em destaque")),
        body: Container(
            color: Colors.black87, child: Obx(() => _moviesGrid(context))));
  }
}
