import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_detail_flutter/UI/Components/MovieDetaiItem.dart';
import 'package:movie_detail_flutter/UI/Screens/MovieDetail/MovieDetailViewModel.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieDetailViewModel viewModel = Get.put(MovieDetailViewModel(
      movieId: int.parse(Get.parameters["movieId"] ?? "")));

  MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) => Scaffold(
          //appBar: AppBar(title: Text(Get.parameters["title"] ?? "Movie")),
          body: Obx(
        () => ListView(
          padding: const EdgeInsets.fromLTRB(15, 100, 15, 0),
          children: [
            Center(
              child: Text("Hi I'm Flutter Screen",
                  style: TextStyle(fontSize: 20.0)),
            ),
            Divider(),
            for (var movie in viewModel.movies) MovieDetaiItem(movie: movie)
          ],
        ),
      ));
}
