import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_dev/space_shooter/src/bloc/space_shooter_bloc.dart';

class ScoreOverlay extends StatelessWidget {
  const ScoreOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight, // Position the score at the top-right corner
      child: Container(
        padding: EdgeInsets.all(12), // Add some padding for better spacing
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.7), // Semi-transparent black background
          borderRadius: BorderRadius.circular(10), // Rounded corners
          border: Border.all(color: Colors.white, width: 2), // White border
        ),
        margin: EdgeInsets.all(16), // Space around the score overlay
        child: BlocBuilder<SpaceShooterBloc, SpaceShooterState>(
          builder: (context, state) {
            return Text(
              'Kills: ${state.kills}', // Display the score with a label
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
