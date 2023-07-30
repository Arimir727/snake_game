import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:snake_game/game/dimensions.dart';

class Food extends PositionComponent with CollisionCallbacks {
  final _paint = Paint()..color = const Color(0xFFF70707);

  @override
  FutureOr<void> onLoad() {
    size = kTileSize;
    respawn();
    add(RectangleHitbox());
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(kTileSize.toRect(), _paint);
  }

  void respawn() {
    position = kTileSize.clone()
      ..multiply(
        Vector2(
          1 + Random().nextInt(kColNum).toDouble(),
          1 + Random().nextInt(kRowNum).toDouble(),
        ),
      );
  }
}
