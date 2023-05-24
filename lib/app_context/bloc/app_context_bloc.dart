import 'package:anime_repository/anime_repository.dart';
import 'package:moviles_lab1/app_context/app_context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppContextBloc extends Bloc<AppContextEvent, AppContextState> {
  AppContextBloc() : super(const AppContextState()) {
    on<GetAnimes>(_handleGetAnimes);
    on<GetGenres>(_handleGetGenres);
  }

  Future<void> _handleGetGenres(
    GetGenres event,
    Emitter<AppContextState> emit,
  ) async {
    try {
      print('intentando fetchedGenres');
      final fetchedGenres = await animeAPI.getGenres();
      print('fetchedGenres');
      print(fetchedGenres);
      emit(state.copyWith(
        genres: fetchedGenres,
      ));
    } catch (e) {
      Exception();
    }
  }

  Future<void> _handleGetAnimes(
    GetAnimes event,
    Emitter<AppContextState> emit,
  ) async {
    try {
      print('intentando fetchedAnimessssssssssss');
      final fetchedAnimes = await animeAPI.getAnimes();
      print('intentando fetchedAnimessssssssssss 22222222222222');

      print('fetchedAnimesssssssssssssssssssssssssssssssss:');
      print(fetchedAnimes);
      emit(state.copyWith(
        animes: fetchedAnimes,
      ));
    } catch (e) {
      Exception();
    }
  }

  final AnimeRepository animeAPI = AnimeRepository();
}
