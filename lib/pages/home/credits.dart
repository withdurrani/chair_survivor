import 'package:flutter/material.dart';

import '../../constants.dart';

class Credits extends StatelessWidget {
  const Credits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _goldColor = Color(0xFFFFD700);
    const double _height = 30;
    final _textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Icon(Icons.monetization_on, size: 40, color: _goldColor),
                const SizedBox(height: _height),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Earned Credits', style: _textTheme.bodyLarge),
                    Text('₹3,500', style: _textTheme.headline5),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: _height),
        const ExpansionTile(
          title: Text('About Game'),
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(Constants.aboutGame),
            ),
          ],
        ),
      ],
    );
  }
}
