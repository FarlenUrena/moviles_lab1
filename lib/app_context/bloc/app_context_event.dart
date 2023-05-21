import 'package:anime_repository/anime_repository.dart';

abstract class AppContextEvent {
  const AppContextEvent();
}

class GetGenres extends AppContextEvent {}

class GetAnimes extends AppContextEvent {}

class UpdateGenre extends AppContextEvent {
  const UpdateGenre(this.currentGenre);

  final String currentGenre;
}

class UpdateAnime extends AppContextEvent {
  const UpdateAnime(this.currentAnime);

  final AnimeModel currentAnime;
}
