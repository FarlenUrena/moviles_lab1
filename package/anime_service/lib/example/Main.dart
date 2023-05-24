import 'package:anime_service/anime_service.dart';

void TestAnime(List<dynamic> animeList) {
  for (var anime in animeList) {
    final title = anime['title']['romaji'];
    final type = anime['type'];
    final genres = anime['genres'];
  }
}

void TestCharacter(List<dynamic> characterList) {
  for (var character in characterList) {
    final characterId = character['node']['id'];
    final characterName = character['node']['name']['full'];
    final characterImage = character['node']['image']['large'];
  }
}

void main() async {
  final animeService = AnimeService();
  final animeList = await animeService.getAnimeList();
  //TestCharacter(animeList);
}
