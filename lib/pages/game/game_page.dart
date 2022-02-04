import 'package:chair_survivor/viewmodels/game_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'players_list.dart';

class GamePage extends StatefulWidget {
  final String title;
  const GamePage({Key? key, required this.title}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () => context
          .read<GameViewModel>()
          .startGame(interval: const Duration(milliseconds: 1500)),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => _onBackPressed(context)),
        title: Text(widget.title),
      ),
      body: const PlayersList(),
    );
  }

  void _onBackPressed(BuildContext context) {
    context.read<GameViewModel>().resetGame();
    Navigator.pop(context);
  }
}
