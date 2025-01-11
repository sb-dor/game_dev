import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_dev/space_shooter/src/space_shooter_game.dart';

import 'src/bloc/space_shooter_bloc.dart';
import 'src/overlays/score_overlay.dart';

class MainShooterSpaceGame extends StatelessWidget {
  const MainShooterSpaceGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SpaceShooterBloc>(create: (_) => SpaceShooterBloc()),
      ],
      child: MaterialApp(
        home: _Game(),
        debugShowCheckedModeBanner: !kReleaseMode,
      ),
    );
  }
}

final pauseOverlayIdentifier = 'PauseMenu';
final secondaryOverlayIdentifier = 'Continue';
final killStats = "KillStatsOverlay";

class _Game extends StatelessWidget {
  const _Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GameWidget(
          game: SpaceShooterGame(
            spaceShooterBloc: context.read<SpaceShooterBloc>(),
          ),
          overlayBuilderMap: {
            killStats: (context, game) {
              return ScoreOverlay();
            },
            pauseOverlayIdentifier: (BuildContext context, SpaceShooterGame game) {
              return Text('A pause menu');
            },
            secondaryOverlayIdentifier: (BuildContext context, SpaceShooterGame game) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    game.overlays.remove(secondaryOverlayIdentifier);
                    game.resumeEngine();
                  },
                  child: Text('Continue the game'),
                ),
              );
            },
          },
        ),
      ),
    );
  }
}
