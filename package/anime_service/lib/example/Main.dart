import 'package:anime_service/anime_service.dart';

void TestAnime(List<dynamic> animeList) {
  for (var anime in animeList) {
    final title = anime['title']['romaji'];
    final type = anime['type'];
    final genres = anime['genres'];
    print(anime);
    // print('Title: $title');
    //print('Type: $type');
    // print('Genres: $genres');
    //  print('---');
  }
}

void TestCharacter(List<dynamic> characterList) {
  for (var character in characterList) {
    final characterId = character['node']['id'];
    final characterName = character['node']['name']['full'];
    final characterImage = character['node']['image']['large'];

    print('Character ID: $characterId');
    print('Character Name: $characterName');
    print('Character Image: $characterImage');
    print('---');
  }
}

void main() async {
  final animeService = AnimeService();
  final animeList = await animeService.getAnimeList();
  //TestCharacter(animeList);
  print(animeList);
}
