import 'dart:async';

import 'package:flame/components.dart';
import 'package:game_dev/space_shooter/src/space_shooter_game.dart';

class SpaceShooterExplosion extends SpriteAnimationComponent with HasGameRef<SpaceShooterGame> {
  //
  SpaceShooterExplosion({super.position})
      : super(
          removeOnFinish: true,
        );

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    animation = await gameRef.loadSpriteAnimation(
      'explosion.png',
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: .05,
        textureSize: Vector2(32, 32),
        loop: false,
      ),
    );
  }
}
