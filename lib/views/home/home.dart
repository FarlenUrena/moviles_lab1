import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
          child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                  onPressed: () {
                    // Button pressed callback
                    print('Button Pressed!');
                    Navigator.pushNamed(context, '/animes');
                  },
                  child: const Text('View Waifus UwU',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )))))
    ]));
  }
}
