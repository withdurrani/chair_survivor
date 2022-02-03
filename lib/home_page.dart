import 'package:chair_survivor/viewmodels/game_viewmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameViewModel = GameViewModel(totalSeats: 10);
    final players = gameViewModel.notOutPlayers;
    return Scaffold(
      body: StreamBuilder<int>(
        stream: gameViewModel.startGame(interval: const Duration(seconds: 1)),
        initialData: 0,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? const Text('No data')
              : _ListView(index: snapshot.data!, players: players);
        },
      ),
    );
  }
}

class _ListView extends StatefulWidget {
  final int index;
  const _ListView({
    Key? key,
    required this.index,
    required this.players,
  }) : super(key: key);

  final List<int> players;

  @override
  State<_ListView> createState() => _ListViewState();
}

class _ListViewState extends State<_ListView> {
  final _key = GlobalKey<AnimatedListState>();

  @override
  void didUpdateWidget(covariant _ListView oldWidget) {
    debugPrint('widgetIndex: ${widget.index}');
    _key.currentState!.removeItem(
        widget.index,
        (context, animation) => _Item(
              item: widget.index,
              animation: animation,
            ));
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(widget.players.toString());
    return Scaffold(
      body: AnimatedList(
        key: _key,
        initialItemCount: widget.players.length,
        itemBuilder: (context, i, animation) {
          return _Item(item: widget.players[i], animation: animation);
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.item,
    required this.animation,
  }) : super(key: key);

  final int item;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: SizedBox(
        height: 40,
        child: Card(child: Text('$item')),
      ),
    );
  }
}
