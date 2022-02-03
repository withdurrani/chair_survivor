import 'package:chair_survivor/constants.dart';
import 'package:flutter/material.dart';

import 'credits.dart';
import 'game_rooms.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Constants.appName),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.meeting_room), text: Constants.mainTabName),
              Tab(icon: Icon(Icons.score), text: Constants.creditsTabName),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GameRooms(),
            Credits(),
          ],
        ),
      ),
    );
  }
}
