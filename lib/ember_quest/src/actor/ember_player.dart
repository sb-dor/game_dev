import 'dart:async';

import 'package:flame/components.dart';
import 'package:game_dev/ember_quest/src/actor/i_player.dart';
import 'package:game_dev/ember_quest/src/ember_quest_game.dart';

class EmberPlayer extends SpriteAnimationComponent
    with HasGameRef<EmberQuestGame>
    implements IPlayer {
  EmberPlayer({required super.position})
      : super(
          size: Vector2.all(64),
          anchor: Anchor.center,
        );

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    animation = SpriteAnimation.fromFrameData(
      // because first time of entering to the app we will load images there and get from cache
      gameRef.images.fromCache(
        '$emberQuestPath/ember.png',
      ),
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.12,
        textureSize: Vector2.all(16),
      ),
    );
  }
}
