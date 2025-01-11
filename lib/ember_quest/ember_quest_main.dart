import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_dev/space_shooter/src/bloc/space_shooter_bloc.dart';

import 'src/ember_quest_game.dart';

class EmberQuestMain extends StatelessWidget {
  const EmberQuestMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SpaceShooterBloc()) // temp, delete then
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: !kReleaseMode,
        home: _Game(),
      ),
    );
  }
}

class _Game extends StatelessWidget {
  const _Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GameWidget(
          game: EmberQuestGame(),
        ),
      ),
    );
  }
}
