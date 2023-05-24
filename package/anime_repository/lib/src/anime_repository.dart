import 'package:anime_repository/src/models/anime_model.dart';
import 'package:anime_service/anime_service.dart';

///
class AnimeRepository {
  ///
  AnimeRepository({AnimeService? animeService})
      : _animeService = animeService ?? AnimeService();

  final AnimeService _animeService;

  ///
  Future<List<AnimeModel>> getAnimes() async {
    final List<AnimeModel> animes = const [];
    try {
      print('api fetchin...');
      final animesFetched =
          await _animeService.getAnimeList() as List<AnimeModel>;

      print('api fetch');

      print(animesFetched);
      for (final anime in animesFetched) {
        animes.add(
          AnimeModel(
            id: anime.id,
            title: AnimeTitle(
              english: anime.title.english,
              romaji: anime.title.romaji,
              native: anime.title.native,
            ),
            type: anime.type,
            genres: anime.genres,
          ),
        );
      }
      print("Repo" + animes[0].title.english);
      return animes;
    } catch (_) {
      throw Exception();
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
