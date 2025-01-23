import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dad_jokes/features/random_joke/data/jokes.dart';
import 'package:dad_jokes/features/random_joke/models/rating.dart';

class JokesAPI {
  static String getRandomJoke() => jokes[Random().nextInt(jokes.length)];

  static Future<DocumentReference<Map<String, dynamic>>> postJokeRating(String joke, Rating rating) {
    return FirebaseFirestore.instance.collection('Ratings').add(<String, dynamic>{
      'joke': joke,
      'score': rating.score,
    });
  }
}
