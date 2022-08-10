import 'package:movie_detail_flutter/Models/MovieItem.dart';
import 'package:movie_detail_flutter/Models/PopularMovieList.dart';
import 'package:movie_detail_flutter/Repositories/ApiRepository.dart';
import 'package:movie_detail_flutter/Utilities/ApiEndpoints.dart';

class MovieService {
  static Future<PopularMovieList> getPopularMovies({int page = 1}) async {
    final json = await ApiRepository.get(ApiEndpoints.moviePopular(page));
    return PopularMovieList.fromJson(json);
  }

  static Future<MovieItem> getMovieDetail(int id) async {
    final json = await ApiRepository.get(ApiEndpoints.movieDetail(id));
    return MovieItem.fromJson(json);
  }
}
