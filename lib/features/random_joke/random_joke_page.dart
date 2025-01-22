import 'package:dad_jokes/features/random_joke/joke_card.dart';
import 'package:dad_jokes/features/random_joke/joke_rater.dart';
import 'package:dad_jokes/features/random_joke/data/jokes.dart';
import 'package:dad_jokes/features/random_joke/models/rating.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class RandomJokePage extends StatefulWidget {
  const RandomJokePage({
    super.key,
  });

  @override
  State<RandomJokePage> createState() => _RandomJokePageState();
}

class _RandomJokePageState extends State<RandomJokePage> {
  var _joke = jokes[Random().nextInt(jokes.length)];

  var _isRatingVisible = false;

  void _toggleShowRating() {
    setState(() {
      _isRatingVisible = !_isRatingVisible;
    });
  }

  void _getNewJoke() {
    setState(() {
      _joke = jokes[Random().nextInt(jokes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          JokeCard(joke: _joke),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: _toggleShowRating,
                icon: Icon(Icons.star),
                label: Text('How did I do?'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _getNewJoke,
                child: Text('Next'),
              ),
            ],
          ),
          SizedBox(height: 20),
          AnimatedOpacity(
            opacity: _isRatingVisible ? 1 : 0,
            duration: Duration(milliseconds: 250),
            child: JokeRater(
              enabled: _isRatingVisible,
              onSubmit: (Rating rating) => print('Submitted score is: ${rating.score}')),
          ),
        ],
      ),
    );
  }
}
