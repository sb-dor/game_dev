part of 'space_shooter_bloc.dart';

@immutable
sealed class SpaceShooterState {
  final int kills;

  const SpaceShooterState(this.kills);
}

final class SpaceShooterInitial extends SpaceShooterState {
  const SpaceShooterInitial(super.kills);
}
