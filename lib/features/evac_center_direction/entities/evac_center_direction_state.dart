import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kalog_batangan_app/errors/service_error.dart';

class EvacCenterDirectionState extends Equatable {
  final Position? currentPos;
  final ServiceError? error;

  EvacCenterDirectionState({this.currentPos, this.error});

  @override
  List<Object?> get props => [currentPos, error];

  EvacCenterDirectionState copyWith({
    Position? currentPos,
    ServiceError? error,
  }) {
    return EvacCenterDirectionState(
      currentPos: currentPos ?? this.currentPos,
      error: error ?? this.error,
    );
  }

  factory EvacCenterDirectionState.initial() {
    return EvacCenterDirectionState(currentPos: null, error: null);
  }
}
