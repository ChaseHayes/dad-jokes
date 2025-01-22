import 'package:dad_jokes/features/random_joke/models/rating.dart';
import 'package:flutter/material.dart';

class JokeRater extends StatefulWidget {
  const JokeRater({
    super.key,
    required enabled,
    required onSubmit,
  }) : _enabled = enabled, _onSubmit = onSubmit;

  final bool _enabled;
  final void Function(Rating) _onSubmit;

  @override
  State<JokeRater> createState() => _JokeRaterState();
}

class _JokeRaterState extends State<JokeRater> {
  var _rating = Rating(0);

  void _setRating(int score) {
    setState(() {
      _rating = Rating(score);
    });
  }

  bool _isStarFilled(int starNumber) {
    return _rating.score >= starNumber;
  }

  void _handleSubmit() {
    widget._onSubmit(_rating);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [1, 2, 3, 4, 5]
                    .map((ratingNumber) => TextButton(
                        child: Icon(
                          _isStarFilled(ratingNumber) ? Icons.star : Icons.star_border,
                          size: 30,
                        ),
                        onPressed: () => widget._enabled ? _setRating(ratingNumber) : null,
                      )
                    )
                    .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextButton(
                    onPressed: _handleSubmit,
                    child: Text('Submit')
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
