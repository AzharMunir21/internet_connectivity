import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/InternetBlock/InternetEvent.dart';
import 'package:internet_connectivity/InternetBlock/InternetState.dart';

class InternetBlock extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetBlock() : super(InternetInitialState()) {
    on<InternetLossEvent>((event, emit) => emit(InternetLossState()));
    on<InternetGainEvent>((event, emit) => emit(InternetGainState()));
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainEvent());
      } else {
        add(InternetLossEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
