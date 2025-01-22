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
  });

  final bool enabled;
  final Rating rating;
  final void Function() onSubmit;
  final void Function(int) onRateSelect;
  final bool Function(int) isStarFilled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                AnimatedOpacity(
                  opacity: 1,
                  duration: Duration(milliseconds: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [1, 2, 3, 4, 5]
                          .map((ratingNumber) => TextButton(
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
