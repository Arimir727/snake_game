import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:snake_game/game/dimensions.dart';

class Ground extends PositionComponent {
  final _paint = Paint()..color = const Color(0xFFD3C722);
  final _gridPaint = Paint()..color = const Color(0xFFFFFFFF);
  // final _colNum = 28;
  // final _rowNum = 28;

  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    size = kTileSize.clone()..multiply(Vector2.all(kColNum * 1.0));
    position = kTileSize.clone()..multiply(Vector2.all(1));
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
    for (var i = 0; i < kColNum - 1; i++) {
      canvas.drawLine(
        Vector2(kTileSize.x * (i + 1), 0).toOffset(),
        Vector2(kTileSize.x * (i + 1), size.y).toOffset(),
        _gridPaint,
      );
    }

    for (var i = 0; i < kRowNum - 1; i++) {
      canvas.drawLine(
        Vector2(0, kTileSize.y * (i + 1)).toOffset(),
        Vector2(size.x, kTileSize.y * (i + 1)).toOffset(),
        _gridPaint,
      );
    }
  }
}
