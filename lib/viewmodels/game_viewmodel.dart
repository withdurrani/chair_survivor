import 'package:flutter/material.dart';

class GameViewModel {
  GameViewModel({required int totalSeats}) {
    _players = List<int>.generate(totalSeats, (i) => i + 1);
    _notOutPlayers = [..._players];
  }
  late final List<int> _players;
  late final List<int> _notOutPlayers;
  int _index = 0;
  int _exitPlayer = 0;
  int _elementIndex = 0;

  List<int> get players => _players;
  List<int> get notOutPlayers => _notOutPlayers;
  int get exitPlayer => _exitPlayer;
  int get remainingPlayers => _notOutPlayers.length;

  Stream<int> startGame({required Duration interval}) async* {
    while (_notOutPlayers.length > 1) {
      await Future.delayed(interval);
      if (_notOutPlayers.length < _exitPlayer) {
        _exitPlayer = (_notOutPlayers.length - _elementIndex - _index).abs();
        while (_exitPlayer >= _notOutPlayers.length) {
          _exitPlayer = _exitPlayer - _notOutPlayers.length;
        }
      }

      debugPrint('${_notOutPlayers[_exitPlayer]}');
      _elementIndex =
          _notOutPlayers.indexWhere((e) => e == _notOutPlayers[_exitPlayer]);
      _notOutPlayers.removeAt(_exitPlayer);
      _index++;
      _exitPlayer += _index;
      // yield _exitPlayer;
      yield _elementIndex;
    }
  }
}
