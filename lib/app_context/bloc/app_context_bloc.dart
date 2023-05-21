import 'package:anime_repository/anime_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviles_lab1/app_context/app_context.dart';

class AppContextBloc extends Bloc<AppContextEvent, AppContextState> {
  AppContextBloc() : super(const AppContextState()) {
    on<GetGenres>(_handleGetGenres);
  }

  Future<void> _handleGetGenres(
    GetGenres event,
    Emitter<AppContextState> emit,
  ) async {
    try {
      final fetchedGenres = await animeAPI.getGenres();

      emit(state.copyWith(
        genres: fetchedGenres,
      ));
    } catch (e) {
      Exception();
    }
  }

  final AnimeRepository animeAPI = AnimeRepository();
}
