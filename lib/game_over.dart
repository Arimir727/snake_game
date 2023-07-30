import 'package:flutter/material.dart';

import 'game/main_game.dart';

class GameOver extends StatelessWidget {
  const GameOver({super.key, required this.game});

  final MainGame game;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment(0, -0),
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Game Over ',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 8,
                ),
                FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.restart_alt),
                    label: const Text('Restart'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
