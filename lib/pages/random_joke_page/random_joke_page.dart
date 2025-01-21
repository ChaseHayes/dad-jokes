import 'package:flutter/material.dart';
import './joke_card.dart';

class RandomJokePage extends StatelessWidget {
  const RandomJokePage({
    super.key,
  });

  final randomJoke = '"Why do fathers take an extra pair of socks when they go golfing?" "In case they get a hole in one!"';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          JokeCard(joke: randomJoke),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  print('rate joke');
                },
                icon: Icon(Icons.star),
                label: Text('Rate Me!'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  print('get next joke');
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
