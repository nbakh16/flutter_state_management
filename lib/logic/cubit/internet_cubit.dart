import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_state_management/constants/enums.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternet();
  }

  StreamSubscription<List<ConnectivityResult>> monitorInternet() {
    return connectivityStreamSubscription = connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.wifi)) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (result.contains(ConnectivityResult.mobile)) {
        emitInternetConnected(ConnectionType.mobile);
      } else {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
