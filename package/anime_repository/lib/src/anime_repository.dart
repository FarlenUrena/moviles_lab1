import 'package:anime_service/anime_service.dart';
import 'models/anime_model.dart';

class AnimeRepository { 

  AnimeRepository({AnimeService? animeService}) 
    : _animeService = animeService ??  AnimeService();

  final AnimeService _animeService;

  Future<List> getAnimes()async{
    final List<AnimeModel> animes = [];

    try{
      final animesFetched = await _animeService.getAnimeList() as List<AnimeModel>; 

      for (final anime in animesFetched){
        animes.add(AnimeModel(id : anime.id, title : anime.title, type : anime.type, genres: anime.genres));
      }
      return animes;
    }
    catch(_){
      throw Exception();
    }
  } 
}