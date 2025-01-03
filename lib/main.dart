import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/logic/cubit/internet_cubit.dart';
import 'package:flutter_state_management/presentation/router/app_router.dart';
import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp(connectivity: Connectivity()));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  const MyApp({super.key, required this.connectivity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider(
          create: (context) =>
              CounterCubit(internetCubit: context.read<InternetCubit>()),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc',
        // routes: {
        //   '/': (context) => const CounterScreen(),
        //   '/second': (context) => const SecondScreen(),
        // },
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
