import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'space_shooter_event.dart';

part 'space_shooter_state.dart';

class SpaceShooterBloc extends Bloc<SpaceShooterEvent, SpaceShooterState> {
  SpaceShooterBloc() : super(SpaceShooterInitial(0)) {
    on<SpaceShooterKilledEvent>(_spaceShooterKilledEvent);

    on<ClearShooterKillsEvent>(_clearShooterKillsEvent);
  }

  void _spaceShooterKilledEvent(
    SpaceShooterKilledEvent event,
    Emitter<SpaceShooterState> emit,
  ) async {
    int kills = state.kills;
    kills++;
    emit(SpaceShooterInitial(kills));
  }

  void _clearShooterKillsEvent(
    ClearShooterKillsEvent event,
    Emitter<SpaceShooterState> emit,
  ) async {
    emit(SpaceShooterInitial(0));
  }
}
