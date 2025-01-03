import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/constants/enums.dart';
import 'package:flutter_state_management/logic/cubit/internet_cubit.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0, wasIncremented: false)) {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription = internetCubit.stream.listen((intState) {
      if (intState is InternetConnected &&
          intState.connectionType == ConnectionType.wifi) {
        increment();
        increment();
      }
      if (intState is InternetConnected &&
          intState.connectionType == ConnectionType.mobile) {
        increment();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
