import 'package:anime_repository/anime_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviles_lab1/app_context/app_context.dart';
import 'package:moviles_lab1/app_context/bloc/app_context_bloc.dart';

class Animes extends StatelessWidget {
  const Animes({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final genreSelected = arguments['genre'];

    final animes = context.select<AppContextBloc, List<AnimeModel>>(
        (values) => values.state.animes);

    List<AnimeModel> animesFiltered =
        animes.where((anime) => anime.genres.contains(genreSelected)).toList();

    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
          child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
      ))
      // child: TextButton(
      //     onPressed: () {
      //       // Button pressed callback
      //       print('Button Pressed!');
      //       Navigator.pushNamed(context, '/');
      //     },
      //     child: Text(animes[0].title.romaji,
      //         style: const TextStyle(
      //           color: Colors.white,
      //           fontSize: 18,
      //         ))))),
    ]));
  }
}
