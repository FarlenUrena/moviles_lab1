import 'package:anime_repository/src/models/anime_model.dart';
import 'package:anime_repository/src/models/anime_title_model.dart';
import 'package:anime_service/anime_service.dart';

///
class AnimeRepository {
  ///
  AnimeRepository({AnimeService? animeService})
      : _animeService = animeService ?? AnimeService();

  final AnimeService _animeService;

  ///
  Future<List<AnimeModel>> getAnimes() async {
    final List<AnimeModel> animes = [];
    try {
      final animesFetched = await _animeService.getAnimeList();
      animesFetched.forEach((anime) {
        animes.add(
          AnimeModel(
            id: anime.id,
            title: AnimeTitleModel(
              english: anime.title.english,
            ),
            type: anime.type,
            genres: anime.genres,
          ),
        );
      });
      return animes;
    } catch (e) {
      throw e;
    }
  }

//
  Future<List<String>> getGenres() async {
    final List<String> genres = [];
    try {
      final genresFetched = await _animeService.getAllAnimeGenres();

      for (final genre in genresFetched) {
        genres.add(genre);
      }

      return genres;
    } catch (_) {
      throw Exception();
    }
  }
}
