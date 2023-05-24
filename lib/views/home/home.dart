import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviles_lab1/app_context/app_context.dart';
import 'package:moviles_lab1/app_context/bloc/app_context_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final genres = context
        .select<AppContextBloc, List<String>>((values) => values.state.genres);
    print(genres.length);

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
                onPressed: () {
                  // Button pressed callback
                  Navigator.pushNamed(context, '/animes');
                },
                child: const Text('Change page',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )))),
        GridView.builder(
          padding: const EdgeInsets.all(50),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: genres.length,
          itemBuilder: (context, index) {
            final genre = genres[index];

            return Card(
              key: ValueKey(genre),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Expanded(
                  // child:
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/animes',
                        arguments: {
                          'genre': genre
                        }, // Pasar la variable genre como argumento
                      );
                    },
                    child: Text(
                      genre,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        const Text('End of Categories',
            style: TextStyle(
              color: Colors.black,
              fontSize: 60,
            )),
      ],
    )));
  }
}
