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
    return BlocBuilder<AppContextBloc, AppContextState>(
      builder: (context, state) {
        final arguments =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

        final genreSelected = arguments['genre'];
        final animes = state.animes;

        List<AnimeModel> animesFiltered = animes
            .where((anime) => anime.genres.contains(genreSelected))
            .toList();

        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '$genreSelected Genre Animes',
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 40,
                    ),
                    itemCount: animesFiltered.length,
                    itemBuilder: (context, index) {
                      final anime = animesFiltered[index];

                      return Card(
                        key: ValueKey(anime),
                        color: Color.fromRGBO(163, 65, 61, 1),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              anime.title.english,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'ID: ${anime.id}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Type: ${anime.type}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Genres: ${anime.genres.join(", ")}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Text('End of Animes',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
