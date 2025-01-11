import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game_dev/ember_quest/src/ember_quest_game.dart';
import 'package:game_dev/ember_quest/src/object/i_object_block.dart';

import '../i_block.dart';

final class PlatformBlock extends SpriteComponent
    with HasGameRef<EmberQuestGame>
    implements IObjectBlock {
  final Vector2 gridPosition;
  double xOffset;
  final Vector2 velocity = Vector2.zero();

  PlatformBlock({
    required this.gridPosition,
    required this.xOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.bottomLeft);

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    final platformImage = game.images.fromCache('ember_quest/block.png');
    sprite = Sprite(platformImage);
    position = Vector2((gridPosition.x * size.x) + xOffset,
      game.size.y - (gridPosition.y * size.y),
    );
    add(RectangleHitbox(collisionType: CollisionType.passive));
  }

  @override
  void update(double dt) {
    velocity.x = game.objectSpeed;
    position += velocity * dt;
    if (position.x < -size.x) removeFromParent();
    super.update(dt);
  }
}
