import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(
      game: Game(),
    ),
  );
}

class Game extends FlameGame with TapDetector, DragCallbacks {
  late final SpriteComponent player;
  late JoystickComponent joystick;
  //
  // @override
  // void render(Canvas canvas) async {
  //   super.render(canvas);
  //
  //   canvas.drawRect(size.toRect(), Paint()..color = Colors.green);
  // }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('sprite_1.png'), // Farthest layer
      ],
      baseVelocity: Vector2(20, 0), // Scrolling speed
      velocityMultiplierDelta: Vector2(1.5, 1.0), // Different speeds for each layer
    );


    add(parallax);

    player = SpriteComponent()
      ..sprite = await loadSprite("sprite_1.png")
      ..size = Vector2(100, 100)
      ..position = Vector2(200, 300);

    joystick = JoystickComponent(
      knob: CircleComponent(
        radius: 20,
        paint: Paint()..color = const Color(0xFF00FF00),
      ), // Knob design
      background: CircleComponent(
        radius: 50,
        paint: Paint()..color = const Color(0x7700FF00),
      ), // Background design
      margin: const EdgeInsets.only(left: 20, bottom: 20), // Position on screen
    );

    add(joystick);
    add(player);
  }

  // @override
  // void onTapDown(TapDownInfo info) {
  //   super.onTapDown(info);
  //   player.position += Vector2(10, 0);
  // }

  @override
  void update(double dt) {
    super.update(dt);
    final newPosition = player.position + joystick.delta * 4 * dt;

    // Ensure the player stays within the screen boundaries
    if (newPosition.x >= 0 && newPosition.x + player.size.x <= size.x) {
      player.position.x = newPosition.x;
    }
    if (newPosition.y >= 0 && newPosition.y + player.size.y <= size.y) {
      player.position.y = newPosition.y;
    }
  }
}
