import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:game_dev/space_shooter/src/bloc/space_shooter_bloc.dart';
import 'package:game_dev/space_shooter/src/space_shooter_bullet.dart';
import 'package:game_dev/space_shooter/src/space_shooter_explosion.dart';
import 'package:game_dev/space_shooter/src/space_shooter_game.dart';

class SpaceShooterEnemy extends SpriteAnimationComponent
    with
        CollisionCallbacks,
        HasGameRef<SpaceShooterGame>,
        FlameBlocReader<SpaceShooterBloc, SpaceShooterState> {
  SpaceShooterEnemy({
    super.position,
  }) : super(
          size: Vector2.all(enemySize),
          anchor: Anchor.center,
        );

  static const enemySize = 50.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    animation = await gameRef.loadSpriteAnimation(
      'enemy.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: .2,
        textureSize: Vector2.all(16),
      ),
    );

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += dt * 250;

    if (position.y > gameRef.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is SpaceShooterBullet) {
      removeFromParent();
      other.removeFromParent();
      gameRef.add(SpaceShooterExplosion(position: position));
      bloc.add(SpaceShooterKilledEvent());
    }
  }
}
