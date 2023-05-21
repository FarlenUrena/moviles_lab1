import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'anime_app_state.dart';

class AnimeAppCubit extends Cubit<AnimeAppState> {
  AnimeAppCubit() : super(AnimeAppState());
}
