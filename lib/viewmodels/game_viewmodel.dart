import 'package:chair_survivor/models/player.dart';
import 'package:flutter/material.dart';

class GameViewModel with ChangeNotifier {
  GameViewModel({required int totalSeats}) {
    _totalSeats = totalSeats;
    _init();
  }

  //=========== Initializers ===========
  late final int _totalSeats;
  late List<Player> _players;
  late List<Player> _notOutPlayers;
  int _index = 0;
  int _exitPlayerIndex = 0;
  int _playerIndex = 0;
  bool _isGameRunning = false;

  //=========== Getters ===========
  List<Player> get players => _players;
  List<Player> get notOutPlayers => _notOutPlayers;
  bool get didGameComplete => _didGameComplete;
  Player? get manOfTheMatch => _manOfTheMatch;
  bool get isGameRunning => _isGameRunning;
  bool get _didGameComplete => _notOutPlayers.length == 1;
  Player? get _manOfTheMatch =>
      _notOutPlayers.length != 1 ? null : _notOutPlayers.first;

  //=========== Private Methods ===========
  void _init() {
    _players = List<Player>.generate(_totalSeats, (i) => Player(id: i + 1));
    _notOutPlayers = [..._players];
  }

  void _updatePlayer(int index, bool isVisible) {
    final _player = Player(id: _players[index].id, isVisible: isVisible);
    _players[index] = _player;
    notifyListeners();
  }

  //=========== Public Methods ===========
  void startGame({required Duration interval}) async {
    _isGameRunning = true;
    while (_notOutPlayers.length > 1 && _isGameRunning) {
      //checking if circular round is completed
      if (_notOutPlayers.length <= _exitPlayerIndex) {
        _exitPlayerIndex =
            (_notOutPlayers.length - _playerIndex - _index).abs();
        //making sure the circular count continues progress for larger skipping
        //and smaller circles (players)
        while (_exitPlayerIndex >= _notOutPlayers.length) {
          _exitPlayerIndex = _exitPlayerIndex - _notOutPlayers.length;
        }
      }

      _playerIndex = _notOutPlayers
          .indexWhere((e) => e == _notOutPlayers[_exitPlayerIndex]);
      int _outPlayerId = _notOutPlayers[_exitPlayerIndex].id - 1;
      _updatePlayer(_outPlayerId, false);
      _notOutPlayers.removeAt(_exitPlayerIndex);
      _index++;
      _exitPlayerIndex += _index;
      await Future.delayed(interval);
    }
  }

  void resetGame() {
    _isGameRunning = false;
    _index = 0;
    _exitPlayerIndex = 0;
    _playerIndex = 0;
    _init();
  }
}
