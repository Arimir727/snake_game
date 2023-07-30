import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/services.dart';
import 'package:snake_game/components/food.dart';
import 'package:snake_game/game/dimensions.dart';
import 'package:snake_game/game/main_game.dart';

import '../game/directions.dart';
import 'ground.dart';

class Snake extends PositionComponent
    with CollisionCallbacks, HasGameReference<MainGame> {
  final _paint = Paint()..color = const Color(0xFF83BDF6);
  final _speed = kTileSize.x * 0.1;
  var _direction = Direction.down;
  Direction? _pendingDirection = null;

  @override
  FutureOr<void> onLoad() {
    position = kTileSize.clone()..multiply(Vector2(20, 16));
    size = kTileSize;

    // TODO: Add hit boxes to all segements of the snake
    add(RectangleHitbox());
    add(
      KeyboardListenerComponent(
        keyDown: {
          LogicalKeyboardKey.keyA: (_) => _left(),
          LogicalKeyboardKey.keyW: (_) => _up(),
          LogicalKeyboardKey.keyS: (_) => _down(),
          LogicalKeyboardKey.keyD: (_) => _right(),
        },
      ),
    );
  }

  @override
  void update(double dt) {
    if (_pendingDirection != null &&
        position.x % kTileSize.x == 0 &&
        position.y % kTileSize.y == 0) {
      _direction = _pendingDirection!;
    }
    position += switch (_direction) {
      Direction.up => Vector2(0, -_speed),
      Direction.down => Vector2(0, _speed),
      Direction.left => Vector2(-_speed, 0),
      Direction.right => Vector2(_speed, 0),
    };
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(kTileSize.toRect(), _paint);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Food) {
      other.respawn();
    }
    if (other is Ground) {
      game.gameOver();
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  bool _up() {
    _pendingDirection = Direction.up;
    return true;
  }

  bool _down() {
    _pendingDirection = Direction.down;
    return true;
  }

  bool _left() {
    _pendingDirection = Direction.left;
    return true;
  }

  bool _right() {
    _pendingDirection = Direction.right;
    return true;
  }
}
