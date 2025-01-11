import 'package:flame/components.dart';
import 'package:game_dev/ember_quest/src/actor/water_enemy.dart';
import 'package:game_dev/ember_quest/src/i_block.dart';
import 'package:game_dev/ember_quest/src/object/ground_block.dart';
import 'package:game_dev/ember_quest/src/object/platform_block.dart';
import 'package:game_dev/ember_quest/src/object/star.dart';

class BlocKManager<T> {
  final Vector2 gridPosition;
  final T blockType;

  BlocKManager(this.gridPosition, this.blockType);
}

final segments = <List<BlocKManager>>[
  segment0,
  segment1,
  segment2,
  segment3,
  segment4,
];

final segment0 = <BlocKManager>[
  BlocKManager(Vector2(0, 0), GroundBlock),
  BlocKManager(Vector2(1, 0), GroundBlock),
  BlocKManager(Vector2(2, 0), GroundBlock),
  BlocKManager(Vector2(3, 0), GroundBlock),
  BlocKManager(Vector2(4, 0), GroundBlock),
  BlocKManager(Vector2(5, 0), GroundBlock),
  BlocKManager(Vector2(5, 1), WaterEnemy),
  BlocKManager(Vector2(5, 3), PlatformBlock),
  BlocKManager(Vector2(6, 0), GroundBlock),
  BlocKManager(Vector2(6, 3), PlatformBlock),
  BlocKManager(Vector2(7, 0), GroundBlock),
  BlocKManager(Vector2(7, 3), PlatformBlock),
  BlocKManager(Vector2(8, 0), GroundBlock),
  BlocKManager(Vector2(8, 3), PlatformBlock),
  BlocKManager(Vector2(9, 0), GroundBlock),
];

final segment1 = <BlocKManager>[
  BlocKManager(Vector2(0, 0), GroundBlock),
  BlocKManager(Vector2(1, 0), GroundBlock),
  BlocKManager(Vector2(1, 1), PlatformBlock),
  BlocKManager(Vector2(1, 2), PlatformBlock),
  BlocKManager(Vector2(1, 3), PlatformBlock),
  BlocKManager(Vector2(2, 6), PlatformBlock),
  BlocKManager(Vector2(3, 6), PlatformBlock),
  BlocKManager(Vector2(6, 5), PlatformBlock),
  BlocKManager(Vector2(7, 5), PlatformBlock),
  BlocKManager(Vector2(7, 7), Star),
  BlocKManager(Vector2(8, 0), GroundBlock),
  BlocKManager(Vector2(8, 1), PlatformBlock),
  BlocKManager(Vector2(8, 5), PlatformBlock),
  BlocKManager(Vector2(8, 6), WaterEnemy),
  BlocKManager(Vector2(9, 0), GroundBlock),
];

final segment2 = <BlocKManager>[
  BlocKManager(Vector2(0, 0), GroundBlock),
  BlocKManager(Vector2(1, 0), GroundBlock),
  BlocKManager(Vector2(2, 0), GroundBlock),
  BlocKManager(Vector2(3, 0), GroundBlock),
  BlocKManager(Vector2(3, 3), PlatformBlock),
  BlocKManager(Vector2(4, 0), GroundBlock),
  BlocKManager(Vector2(4, 3), PlatformBlock),
  BlocKManager(Vector2(5, 0), GroundBlock),
  BlocKManager(Vector2(5, 3), PlatformBlock),
  BlocKManager(Vector2(5, 4), WaterEnemy),
  BlocKManager(Vector2(6, 0), GroundBlock),
  BlocKManager(Vector2(6, 3), PlatformBlock),
  BlocKManager(Vector2(6, 4), PlatformBlock),
  BlocKManager(Vector2(6, 5), PlatformBlock),
  BlocKManager(Vector2(6, 7), Star),
  BlocKManager(Vector2(7, 0), GroundBlock),
  BlocKManager(Vector2(8, 0), GroundBlock),
  BlocKManager(Vector2(9, 0), GroundBlock),
];

final segment3 = <BlocKManager>[
  BlocKManager(Vector2(0, 0), GroundBlock),
  BlocKManager(Vector2(1, 0), GroundBlock),
  BlocKManager(Vector2(1, 1), WaterEnemy),
  BlocKManager(Vector2(2, 0), GroundBlock),
  BlocKManager(Vector2(2, 1), PlatformBlock),
  BlocKManager(Vector2(2, 2), PlatformBlock),
  BlocKManager(Vector2(4, 4), PlatformBlock),
  BlocKManager(Vector2(6, 6), PlatformBlock),
  BlocKManager(Vector2(7, 0), GroundBlock),
  BlocKManager(Vector2(7, 1), PlatformBlock),
  BlocKManager(Vector2(8, 0), GroundBlock),
  BlocKManager(Vector2(8, 8), Star),
  BlocKManager(Vector2(9, 0), GroundBlock),
];

final segment4 = <BlocKManager>[
  BlocKManager(Vector2(0, 0), GroundBlock),
  BlocKManager(Vector2(1, 0), GroundBlock),
  BlocKManager(Vector2(2, 0), GroundBlock),
  BlocKManager(Vector2(2, 3), PlatformBlock),
  BlocKManager(Vector2(3, 0), GroundBlock),
  BlocKManager(Vector2(3, 1), WaterEnemy),
  BlocKManager(Vector2(3, 3), PlatformBlock),
  BlocKManager(Vector2(4, 0), GroundBlock),
  BlocKManager(Vector2(5, 0), GroundBlock),
  BlocKManager(Vector2(5, 5), PlatformBlock),
  BlocKManager(Vector2(6, 0), GroundBlock),
  BlocKManager(Vector2(6, 5), PlatformBlock),
  BlocKManager(Vector2(6, 7), Star),
  BlocKManager(Vector2(7, 0), GroundBlock),
  BlocKManager(Vector2(8, 0), GroundBlock),
  BlocKManager(Vector2(8, 3), PlatformBlock),
  BlocKManager(Vector2(9, 0), GroundBlock),
  BlocKManager(Vector2(9, 1), WaterEnemy),
  BlocKManager(Vector2(9, 3), PlatformBlock),
];
