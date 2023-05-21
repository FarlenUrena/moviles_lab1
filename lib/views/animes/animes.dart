import 'package:flutter/material.dart';

class Animes extends StatelessWidget {
  const Animes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('No waifus found T.T ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            )),
        Center(
            child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                    onPressed: () {
                      // Button pressed callback
                      print('Button Pressed!');
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text('Go Back Very Sad',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ))))),
      ],
    ));
  }
}
