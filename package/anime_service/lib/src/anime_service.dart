import 'dart:convert';

import 'package:anime_repository/src/models/anime_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:anime_repository/src/models/anime_title_model.dart';

class AnimeService {
  final GraphQLClient _client;

  AnimeService() : _client = _createGraphQLClient();

  static GraphQLClient _createGraphQLClient() {
    final HttpLink httpLink = HttpLink('https://graphql.anilist.co/');
    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    );
  }

  ///
  Future<List<AnimeModel>> getAnimeList() async {
    final query = gql('''
    query FetchAnimeList(\$page: Int, \$perPage: Int) {
      Page(page: \$page, perPage: \$perPage) {
        media {
          id
          title {
            english
          }
          type
          genres
        }
      }
    }
  ''');

    final options = QueryOptions(
      document: query,
      variables: {'page': 1, 'perPage': 10},
    );

    final QueryResult result = await _client.query(options);

    print('AAAAAAAAAAAAAAAAAA: ');
    print(result.data?["Page"]["media"]);

    if (result.hasException) {
      throw Exception('Failed to fetch anime list: ${result.exception}');
    }

    final List<dynamic> animeDataList =
        result.data?['Page']['media'] as List<dynamic>? ?? [];
    print('bien aquí');
    final animeList = animeDataList.map((animeData) {
      final titleData = animeData['title'] as Map<String, dynamic>?;
      final englishTitle = titleData?['english'] as String?;
      final title = englishTitle != null
          ? AnimeTitleModel(english: englishTitle)
          : AnimeTitleModel(
              english:
                  'Unknown Title'); // Provide a fallback value for the title

      return AnimeModel(
        id: animeData['id'] as int,
        title: title,
        type: animeData['type'] as String? ??
            'Unknown Type', // Provide a fallback value for the type
        genres: (animeData['genres'] as List<dynamic>?)?.cast<String>() ??
            [], // Provide an empty list as a fallback value for genres
      );
    }).toList();

    print('Anime List:');
    print(animeList);
    animeList.forEach((anime) {
      print('ID: ${anime.id}');
      print('Title: ${anime.title.english}');
      print('Type: ${anime.type}');
      print('Genres: ${anime.genres}');
      print('------------------------');
    });
    return animeList;
  }

  Future<List<String>> getAllAnimeGenres() async {
    const query = r'''
      query GetAllAnimeGenres {
        GenreCollection
      }
    ''';

    final options = QueryOptions(
      document: gql(query),
    );

    final result = await _client.query(options);

    if (result.hasException) {
      throw Exception('Failed to fetch anime genres: ${result.exception}');
    }

    final List<dynamic> genreList =
        result.data?['GenreCollection'] as List<dynamic>;

    if (genreList == null) {
      throw Exception('No anime genres found.');
    }

    return genreList.cast<String>();
  }

  Future<List<dynamic>> getCharacterList(int animeId) async {
    final query = r'''
      query GetCharacterList($animeId: Int!) {
        Media(id: $animeId) {
          characters {
            edges {
              node {
                id
                name {
                  full
                }
                image {
                  large
                }
              }
            }
          }
        }
      }
    ''';

    final options = QueryOptions(
      document: gql(query),
      variables: {'animeId': animeId},
    );

    final result = await _client.query(options);

    if (result.hasException) {
      throw Exception('Failed to fetch character list: ${result.exception}');
    }

    final List<dynamic> characterList =
        result.data?['Media']['characters']['edges'] as List<dynamic>;

    return characterList ?? [];
  }
}
