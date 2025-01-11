import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:game_dev/space_shooter/space_shooter_main.dart';
import 'package:game_dev/space_shooter/src/space_shooter_enemy.dart';

import 'bloc/space_shooter_bloc.dart';
import 'space_shooter_player.dart';

class SpaceShooterGame extends FlameGame with PanDetector, HasCollisionDetection {
  late SpaceShooterPlayer player;

  @override
  bool get pauseWhenBackgrounded => true;

  final SpaceShooterBloc _shooterBloc;

  SpaceShooterGame({
    required SpaceShooterBloc spaceShooterBloc,
  }) : _shooterBloc = spaceShooterBloc;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    overlays.add(killStats);

    /// [size] is a Vector2 variable from the game class and it holds the current dimension of the
    /// game area, where x is the horizontal dimension or the width, and y is the vertical
    /// dimension or the height.

    // you can add you player like this one
    // final playerSprite = await loadSprite('sprite_1.png');
    //
    // player = SpaceShooterPlayer()
    //   ..sprite = playerSprite
    //   ..position = size / 2
    //   ..x = size.x / 2
    //   ..y = size.y / 2
    //   ..width = 100
    //   ..height = 100
    //   ..anchor = Anchor.center;

    // or you can create player with onLoad method inside and it does same thing

    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('rain.png'),
        ParallaxImageData('rain.png'),
      ],
      baseVelocity: Vector2(0, -5),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 15),
    );

    add(parallax);

    player = SpaceShooterPlayer();

    final enemy = SpawnComponent(
      factory: (index) {
        return SpaceShooterEnemy();
      },
      period: 1,
      area: Rectangle.fromLTWH(0, 0, size.x, -SpaceShooterEnemy.enemySize),
      // selfPositioning: true,
    );

    await add(
      FlameMultiBlocProvider(
        providers: [
          FlameBlocProvider<SpaceShooterBloc, SpaceShooterState>.value(
            value: _shooterBloc,
          )
        ],
        children: [
          player,
          enemy,
        ],
      ),
    );
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    super.onPanUpdate(info);
    player.move(info.delta.global);
  }

  @override
  void onPanStart(DragStartInfo info) {
    super.onPanStart(info);
    player.startShooting();
  }

  @override
  void onPanEnd(DragEndInfo info) {
    super.onPanEnd(info);
    player.stopShooting();
  }
}
