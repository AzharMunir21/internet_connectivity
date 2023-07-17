import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetStates { intialState, Lost, Gain }

class InternetCubit extends Cubit<InternetStates> {
  Connectivity _conectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetCubit() : super(InternetStates.intialState) {
    connectivitySubscription =
        _conectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetStates.Gain);
      } else {
        emit(InternetStates.Lost);
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
