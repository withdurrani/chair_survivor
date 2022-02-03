import 'package:flutter/material.dart';

import '../../models/game_room.dart';
import '../../viewmodels/game_room_viewmodel.dart';
import '../game/game_page.dart';

class GameRooms extends StatelessWidget {
  const GameRooms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double spacing = 50;
    final gameRooms = GameRoomViewModel(totalRooms: 10).getGameRooms;
    return SingleChildScrollView(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: spacing,
        runSpacing: spacing,
        children: gameRooms.map((room) => _GameRoom(gameRoom: room)).toList(),
      ),
    );
  }
}

class _GameRoom extends StatelessWidget {
  const _GameRoom({Key? key, required this.gameRoom}) : super(key: key);
  final GameRoom gameRoom;

  @override
  Widget build(BuildContext context) {
    final iconColor =
        gameRoom.isEnabled ? Theme.of(context).primaryColor : Colors.grey;
    return GestureDetector(
      onTap: !gameRoom.isEnabled ? null : () => _navigate(context),
      child: Column(
        children: [
          Icon(Icons.meeting_room, size: 100, color: iconColor),
          Text(gameRoom.name),
        ],
      ),
    );
  }

  void _navigate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GamePage(title: gameRoom.name)),
    );
  }
}
