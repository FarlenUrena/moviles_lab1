import 'package:anime_repository/anime_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppContextState {
  const AppContextState(
      {this.genres = const [],
      this.animes = const [],
      this.currentGenre = '',
      this.currentAnime = const AnimeModel(
          id: '',
          title: AnimeTitle(romaji: '', english: '', native: ''),
          type: '',
          genres: [])});

  final List<String> genres;
  final List<AnimeModel> animes;
  final String currentGenre;
  final AnimeModel currentAnime;

  AppContextState copyWith({
    List<String>? genres,
    List<AnimeModel>? animes,
    String? currentGenre,
    AnimeModel? currentAnime,
  }) =>
      AppContextState(
        genres: genres ?? this.genres,
        animes: animes ?? this.animes,
        currentGenre: currentGenre ?? this.currentGenre,
        currentAnime: currentAnime ?? this.currentAnime,
      );
}
