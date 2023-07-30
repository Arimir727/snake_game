import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:snake_game/components/ground.dart';
import 'package:snake_game/components/snake.dart';
import 'package:snake_game/game/dimensions.dart';

import '../components/food.dart';

class MainGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  final world = World();
  late final cameraComponent = CameraComponent(world: world);

  @override
  FutureOr<void> onLoad() {
    addAll([
      world,
      cameraComponent,
    ]);

    cameraComponent.viewfinder.visibleGameSize = kGameSize;
    cameraComponent.viewfinder.anchor = Anchor.topLeft;

    final ground = Ground();
    final snake = Snake();
    final food = Food();

    world.addAll([
      ground,
      snake,
      food,
    ]);
  }

  void gameOver() {
    overlays.add('game-over');
    pauseEngine();
  }

  void restart() {
    resumeEngine();
    overlays.remove('game-over');
  }
}
