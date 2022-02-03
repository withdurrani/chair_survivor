import 'package:chair_survivor/models/game_room.dart';

class GameRoomViewModel {
  GameRoomViewModel({required int totalRooms}) {
    _gameRooms = List.generate(totalRooms,
        (i) => GameRoom(id: i + 1, name: 'Level ${i + 1}', isEnabled: i == 0));
  }

  late final List<GameRoom> _gameRooms;
  List<GameRoom> get getGameRooms => _gameRooms;
}
