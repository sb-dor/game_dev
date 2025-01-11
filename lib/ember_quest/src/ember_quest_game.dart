import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:game_dev/ember_quest/src/actor/water_enemy.dart';
import 'package:game_dev/ember_quest/src/managers/segment_manager.dart';
import 'package:game_dev/ember_quest/src/object/ground_block.dart';
import 'package:game_dev/ember_quest/src/object/platform_block.dart';
import 'package:game_dev/ember_quest/src/object/star.dart';

import 'actor/ember_player.dart';

const String emberQuestPath = "ember_quest";

class EmberQuestGame extends FlameGame {
  late final EmberPlayer _ember;
  final double objectSpeed = 0.0;

  @override
  Color backgroundColor() => Color.fromARGB(255, 173, 223, 247);

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    Flame.device.setLandscapeRightOnly();

    await images.loadAll([
      '$emberQuestPath/block.png',
      '$emberQuestPath/ember.png',
      '$emberQuestPath/ground.png',
      '$emberQuestPath/heart_half.png',
      '$emberQuestPath/heart.png',
      '$emberQuestPath/star.png',
      '$emberQuestPath/water_enemy.png',
    ]);

    camera.viewfinder.anchor = Anchor.topLeft;
    initializeGame();
  }

  void loadGameSegments(int segmentIndex, double xPositionOffset) {
    for (final each in segments[segmentIndex]) {
      if (each.blockType.toString() == 'GroundBlock') {
        add(
          GroundBlock(
            gridPosition: each.gridPosition,
            xOffset: xPositionOffset,
          ),
        );
      } else if (each.blockType.toString() == 'PlatformBlock') {
        add(
          PlatformBlock(
            gridPosition: each.gridPosition,
            xOffset: xPositionOffset,
          ),
        );
      } else if (each.blockType.toString() == 'WaterEnemy') {
        add(
          WaterEnemy(
            gridPosition: each.gridPosition,
            xOffset: xPositionOffset,
          ),
        );
      } else if (each.blockType.toString() == 'Star') {
        world.add(
          Star(
            gridPosition: each.gridPosition,
            xOffset: xPositionOffset,
          ),
        );
      }
    }
  }

  void initializeGame() {
    // Assume that size.x < 3200
    final segmentsToLoad = (size.x / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);

    for (var i = 0; i <= segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }

    _ember = EmberPlayer(
      position: Vector2(128, canvasSize.y - 70),
    );

    world.add(_ember);
  }
}
