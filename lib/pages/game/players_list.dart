import 'package:chair_survivor/pages/game/player_card.dart';
import 'package:chair_survivor/viewmodels/game_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'winner_banner.dart';

class PlayersList extends StatelessWidget {
  const PlayersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final players = context.watch<GameViewModel>().players;
    final _didGameComplete = context.watch<GameViewModel>().didGameComplete;
    final double _visibleSize = _didGameComplete ? 300 : 50;

    return SingleChildScrollView(
      child: Wrap(
        children: players
            .map(
              (player) => AnimatedContainer(
                duration: const Duration(milliseconds: 1300),
                curve: Curves.easeInBack,
                width: player.isVisible ? _visibleSize : 0,
                height: player.isVisible ? _visibleSize : 0,
                child: _didGameComplete
                    ? WinnerBanner(
                        opacity: player.isVisible ? 1 : 0,
                        child: PlayerCard(player: player),
                      )
                    : PlayerCard(player: player),
              ),
            )
            .toList(),
      ),
    );
  }
}
