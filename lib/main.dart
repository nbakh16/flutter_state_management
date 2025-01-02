import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/presentation/router/app_router.dart';
import 'package:flutter_state_management/presentation/screens/second_screen.dart';
import 'logic/cubit/counter_cubit.dart';
import 'presentation/screens/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
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
