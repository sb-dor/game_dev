import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game_dev/space_shooter/src/space_shooter_game.dart';

class SpaceShooterBullet extends SpriteAnimationComponent with HasGameRef<SpaceShooterGame> {
  SpaceShooterBullet({
    super.position,
  }) : super(
          size: Vector2(25, 50),
          anchor: Anchor.center,
        );

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    animation = await gameRef.loadSpriteAnimation(
      'bullet.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: .2,
        textureSize: Vector2(8, 16),
      ),
    );




    /// [active] collides with other hitboxes of type active or passive
    //
    /// [passive] collides with other hitboxes of type active
    //
    /// [inactive] will not collide with any other hitbox


    // And since in this game we anticipate that there will be more
    // bullets than enemies, we set the bullets to have a passive collision type!
    add(RectangleHitbox(collisionType: CollisionType.passive));
  }


  // We add to the bullet’s y axis position at a rate of -500 pixels per second. Remember going up
  // in the y axis means getting closer to 0 since the top left corner of the screen is 0, 0.
  //
  // If the y is smaller than the negative value of the bullet’s height, means that the component
  // is completely off the screen and it can be removed.

  @override
  void update(double dt) {
    super.update(dt);
    position.y += dt * -500;

    if (position.y < -height) {
      removeFromParent();
    }
  }
}
