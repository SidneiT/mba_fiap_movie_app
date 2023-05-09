import 'package:get/get.dart';
import 'package:movie_app/infraestructure/api.dart';
import 'package:movie_app/modules/movies/controllers/movie_gallery_controller.dart';
import 'package:movie_app/modules/movies/services/movies_service_impl.dart';

class MovieGalleryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieGalleryController>(
        () => MovieGalleryController(MoviesServiceImpl(api: Api())));
  }
}
