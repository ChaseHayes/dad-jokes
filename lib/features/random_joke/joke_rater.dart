import 'package:dad_jokes/features/random_joke/models/rating.dart';
import 'package:flutter/material.dart';

class JokeRater extends StatelessWidget {
  const JokeRater({
    super.key,
    required this.enabled,
    required this.rating,
    required this.onSubmit,
    required this.onRateSelect,
    required this.isStarFilled,
    required this.isThankYouVisible,
  });

  final bool enabled;
  final Rating rating;
  final void Function() onSubmit;
  final void Function(int) onRateSelect;
  final bool Function(int) isStarFilled;
  final bool isThankYouVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [1, 2, 3, 4, 5]
                        .map((ratingNumber) => TextButton(
                          key: Key('Star$ratingNumber'),
                          child: Icon(
                            isStarFilled(ratingNumber) ? Icons.star : Icons.star_border,
                            size: 30,
                          ),
                          onPressed: () => enabled ? onRateSelect(ratingNumber) : null,
                        ))
                        .toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: TextButton(
                        onPressed: () => onSubmit(),
                        child: Text('Submit')
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: isThankYouVisible ? 1 : 0,
          duration: Duration(milliseconds: 150),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Thank you! :)'),
          ),
        )
      ],
    );
  }
}
