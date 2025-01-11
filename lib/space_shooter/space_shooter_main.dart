import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_dev/space_shooter/src/space_shooter_game.dart';

import 'src/bloc/space_shooter_bloc.dart';

class MainShooterSpaceGame extends StatelessWidget {
  const MainShooterSpaceGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SpaceShooterBloc>(create: (_) => SpaceShooterBloc()),
      ],
      child: _Game(),
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
    return GameWidget(
      game: SpaceShooterGame(
        spaceShooterBloc: context.read<SpaceShooterBloc>(),
      ),
      overlayBuilderMap: {
        killStats: (context, game) {
          return Container(
            width: 100,
            height: 100,
            color: Colors.white,
            child: Center(
              child: BlocBuilder<SpaceShooterBloc, SpaceShooterState>(
                builder: (context, state) {
                  return Text(
                    state.kills.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          );
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
    );
  }
}
