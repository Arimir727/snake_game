import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:snake_game/game/main_game.dart';
import 'package:snake_game/game_over.dart';

void main() {
  runApp(GameWidget<MainGame>(
    game: MainGame(),
    overlayBuilderMap: {
      'game-over': (_, game) => GameOver(
            game: game,
          ),
    },
  ));
}
