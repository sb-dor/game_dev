part of 'space_shooter_bloc.dart';

@immutable
sealed class SpaceShooterEvent {}

class SpaceShooterKilledEvent extends SpaceShooterEvent {}

class ClearShooterKillsEvent extends SpaceShooterEvent {}
