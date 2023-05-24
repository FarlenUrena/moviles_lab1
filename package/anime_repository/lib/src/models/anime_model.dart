import 'package:anime_repository/src/models/anime_title_model.dart';

class AnimeModel {
  final int id;
  final AnimeTitleModel title;
  final String type;
  final List<String> genres;

  const AnimeModel({
    required this.id,
    required this.title,
    required this.type,
    required this.genres,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['id'] as int,
      title: AnimeTitleModel.fromJson(json['title'] as Map<String, dynamic>),
      type: json['type'] as String,
      genres: List<String>.from(json['genres'] as List<dynamic>),
    );
  }
}

// Función para convertir la lista de objetos JSON en una lista de AnimeModel
// List<AnimeModel> convertJsonToList(List<dynamic> jsonList) {
//   List<AnimeModel> animeList = [];
//   for (var jsonObj in jsonList) {
//     animeList.add(AnimeModel.fromJson(jsonObj as Map<String, dynamic>));
//   }
//   return animeList;
// }


/*
{
id: 1, 
title: {
  __typename: AnimeTitle, 
  romaji: Cowboy Bebop, 
  english: Cowboy Bebop, 
  native: カウボーイビバップ}, 
type: ANIME, 
genres: 
[
 Action, 
 Adventure,
 Drama, 
 Sci-Fi
]
}
 */