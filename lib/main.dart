import 'package:anime_repository/anime_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviles_lab1/app_context/app_context.dart';
import 'package:moviles_lab1/views/animes/animes.dart';
import 'package:moviles_lab1/views/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AnimeRepository(),
      child: BlocProvider(
        create: (context) => AppContextBloc(),
        child: BlocBuilder<AppContextBloc, AppContextState>(
            builder: (context, state) {
          if (state.genres.isEmpty) {
            context.read<AppContextBloc>().add(GetAnimes());
            context.read<AppContextBloc>().add(GetGenres());
          }
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: state.genres.isNotEmpty
                ? const Home()
                : const Text('Loading...',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                    )),
            routes: {
              '/animes': (context) => const Animes(),
            },
          );
        }),
      ),
    );
  }
}
