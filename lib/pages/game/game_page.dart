import 'package:chair_survivor/viewmodels/game_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'players_list.dart';

class GamePage extends StatelessWidget {
  final String title;
  const GamePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => _onBackPressed(context)),
          title: Text(title),
        ),
        body: const PlayersList(),
        floatingActionButton: const _FloatingActionButton());
  }

  void _onBackPressed(BuildContext context) {
    context.read<GameViewModel>().resetGame();
    Navigator.pop(context);
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isGameRunning = context.watch<GameViewModel>().isGameRunning;

    return _isGameRunning
        ? Container()
        : FloatingActionButton(
            child: const Text('Start'),
            onPressed: () {
              context
                  .read<GameViewModel>()
                  .startGame(interval: const Duration(milliseconds: 1500));
            },
          );
  }
}
