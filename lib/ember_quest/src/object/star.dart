import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/animation.dart';
import 'package:game_dev/ember_quest/src/ember_quest_game.dart';
import 'package:game_dev/ember_quest/src/i_block.dart';
import 'package:game_dev/ember_quest/src/object/i_object_block.dart';

class Star extends SpriteComponent with HasGameRef<EmberQuestGame> implements IObjectBlock {
  final Vector2 gridPosition;
  double xOffset;

  final Vector2 velocity = Vector2.zero();

  Star({
    required this.gridPosition,
    required this.xOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.center);

  @override
  void onLoad() {
    final starImage = game.images.fromCache('$emberQuestPath/star.png');
    sprite = Sprite(starImage);
    position = Vector2(
      (gridPosition.x * size.x) + xOffset + (size.x / 2),
      game.size.y - (gridPosition.y * size.y) - (size.y / 2),
    );

    add(RectangleHitbox(collisionType: CollisionType.passive));

    add(
      SizeEffect.by(
        Vector2(-24, -24),
        EffectController(
          duration: .75,
          reverseDuration: .5,
          infinite: true,
          curve: Curves.easeOut,
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    velocity.x = game.objectSpeed;
    position += velocity * dt;
    if (position.x < -size.x) removeFromParent();
    super.update(dt);
  }
}
