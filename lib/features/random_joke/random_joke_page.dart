import 'package:flutter/material.dart';
import './joke_card.dart';

class RandomJokePage extends StatefulWidget {
  const RandomJokePage({
    super.key,
  });

  @override
  State<RandomJokePage> createState() => _RandomJokePageState();
}

class _RandomJokePageState extends State<RandomJokePage> {
  final randomJoke =
      '"Why do fathers take an extra pair of socks when they go golfing?" "In case they get a hole in one!"';

  var _isRatingVisible = false;

  void _toggleShowRating() {
    setState(() {
      _isRatingVisible = !_isRatingVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Column(
          children: [
            JokeCard(joke: randomJoke),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _toggleShowRating(),
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
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _isRatingVisible ? 1 : 0,
              duration: Duration(milliseconds: 250),
              child: Card(
                margin: EdgeInsets.only(top: 10),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                          child: Icon(Icons.star_border, size: 30),
                          onPressed: () => _isRatingVisible ? print('rate 1') : null
                      ),
                      TextButton(
                          child: Icon(Icons.star_border, size: 30),
                          onPressed: () => _isRatingVisible ? print('rate 2') : null
                      ),
                      TextButton(
                          child: Icon(Icons.star_border, size: 30),
                          onPressed: () => _isRatingVisible ? print('rate 3') : null
                      ),
                      TextButton(
                          child: Icon(Icons.star_border, size: 30),
                          onPressed: () => _isRatingVisible ? print('rate 4') : null
                      ),
                      TextButton(
                          child: Icon(Icons.star_border, size: 30),
                          onPressed: () => _isRatingVisible ? print('rate 5') : null
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
