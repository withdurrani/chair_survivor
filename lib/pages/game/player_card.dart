import 'package:flutter/material.dart';

import '../../models/player.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({Key? key, required this.player}) : super(key: key);
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: player.isVisible ? Colors.white : Colors.red,
      child: Center(child: Text('${player.id}')),
    );
  }
}
