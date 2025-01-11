import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:game_dev/space_shooter/space_shooter_main.dart';
import 'package:game_dev/space_shooter/src/bloc/space_shooter_bloc.dart';
import 'package:game_dev/space_shooter/src/space_shooter_bullet.dart';
import 'package:game_dev/space_shooter/src/space_shooter_enemy.dart';
import 'package:game_dev/space_shooter/src/space_shooter_game.dart';

/// [SpriteComponent]
/// [PositionComponent]
/// [SpriteAnimationComponent]

class SpaceShooterPlayer extends SpriteAnimationComponent
    with
        HasGameRef<SpaceShooterGame>,
        CollisionCallbacks,
        FlameBlocReader<SpaceShooterBloc, SpaceShooterState> {
  late final SpawnComponent _bulletSpawner;

//
  late final Vector2 _initialPosition;

//

// static final _paint = Paint()..color = Colors.white;

  /// if you would extend [PositionComponent]
  /// this render would be helpful to you
  ///
  /// Unlike [PositionComponent], [SpriteComponent] has an implementation for the render method,
  /// so we can delete the previous override.

// @override
// void render(Canvas canvas) {
//   canvas.drawRect(size.toRect(), _paint);
// }

  SpaceShooterPlayer()
      : super(
          size: Vector2(100, 100),
          anchor: Anchor.center,
        );

  /// components also have an onLoad method that can be overridden to do initializations.
  /// But before we implement our player’s load method, note that we use an attribute and the
  /// loadSprite method from the [FlameGame] class.
  ///
  /// That is not a problem! Every time our component needs to access things from its game class,
  /// we can mix our component with the [HasGameRef] mixin; that will add a new variable to our
  /// component called [gameRef] which will point to the game instance where the component is
  /// running. Now, let’s refactor our game a little bit:

  @override
  Future<void> onLoad() async {
    await super.onLoad();

// sprite = await gameRef.loadSprite('sprite_1.png');

    /// [amount] defines how many frames the animation has, in this case 4
//
    /// [stepTime] is the time in seconds that each frame will be rendered, before it gets replaced
    /// with the next one.
//
    /// [textureSize] is the size in pixels which defines each frame of the image.

    animation = await game.loadSpriteAnimation(
      'space_shooter_player.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: Vector2(32, 48),
      ),
    );

    _initialPosition = Vector2(gameRef.size.x / 2, gameRef.size.y - 200);
    position = _initialPosition.clone();

    _bulletSpawner = SpawnComponent(
        selfPositioning: true, // for following player
        autoStart: false,
        factory: (index) {
          return SpaceShooterBullet(
            position: position + Vector2(0, -height / 2),
          );
        },
        period: .2);

    gameRef.add(_bulletSpawner);

    add(RectangleHitbox());
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  void startShooting() {
    _bulletSpawner.timer.start();
  }

  void stopShooting() {
    _bulletSpawner.timer.stop();
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is SpaceShooterEnemy) {
      position = _initialPosition.clone();
      other.removeFromParent();
      gameRef.overlays.add(secondaryOverlayIdentifier);
      bloc.add(ClearShooterKillsEvent());
      gameRef.pauseEngine();
    }
  }
}
