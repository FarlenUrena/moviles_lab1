class AnimeModel {
  final String id;
  final AnimeTitle title;
  final String type;
  final List<String> genres;

  const AnimeModel({
    required this.id,
    required this.title,
    required this.type,
    required this.genres,
  });
}

class AnimeTitle {
  final String romaji;
  final String english;
  final String native;

  const AnimeTitle({
    required this.romaji,
    required this.english,
    required this.native,
  });
}

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