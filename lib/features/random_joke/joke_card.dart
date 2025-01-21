import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({
    super.key,
    required this.joke,
  });

  final String joke;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: Card(
        color: theme.colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            joke,
            style: style,
            textAlign: TextAlign.center,
          ),
        )
      )
    );
  }
}

