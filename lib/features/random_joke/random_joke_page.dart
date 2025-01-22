import 'package:cloud_firestore/cloud_firestore.dart';
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
  var _rating = Rating(0);
  var _isRatingVisible = false;
  var _isThankYouVisible = false;

  void _toggleShowRating() {
    setState(() {
      _isRatingVisible = !_isRatingVisible;
    });
  }

  void _getNewJoke() {
    setState(() {
      _joke = jokes[Random().nextInt(jokes.length)];
      _isRatingVisible = false;
      _isThankYouVisible = false;
      _rating = Rating(0);
    });
  }

  bool _isStarFilled(int starNumber) {
    return _rating.score >= starNumber;
  }

  void _handleRateSelect(int ratingNumber) {
    setState(() {
      _rating = Rating(ratingNumber);
    });
  }

  void _handleSubmit() {
    FirebaseFirestore.instance.collection('Ratings').add(<String, String>{
      'joke': _joke,
      'score': _rating.score.toString(),
    });
    setState(() {
      _isThankYouVisible = true;
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
                rating: _rating,
                onRateSelect: _handleRateSelect,
                isStarFilled: _isStarFilled,
                onSubmit: _handleSubmit,
                isThankYouVisible: _isThankYouVisible,
              )),
        ],
      ),
    );
  }
}
