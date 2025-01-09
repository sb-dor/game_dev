import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

import 'space_shooter_player.dart';

class SpaceShooterGame extends FlameGame with PanDetector {
  late SpaceShooterPlayer player;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

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
    player = SpaceShooterPlayer();

    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('rain.png'),
      ],
      baseVelocity: Vector2(0, -5),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 5),
    );

    add(parallax);

    add(
      player,
    );
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    super.onPanUpdate(info);
    player.move(info.delta.global);
  }
}
