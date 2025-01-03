import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/constants/enums.dart';
import 'package:flutter_state_management/logic/cubit/counter_cubit.dart';
import 'package:flutter_state_management/logic/cubit/internet_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return const Text('Wifi');
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return const Text('Mobile');
                } else {
                  return const Text('No Internet');
                }
              },
            ),
            //BlocConsumer = BlocBuilder and BlocListener
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        state.wasIncremented ? 'Incremented' : 'Decremented'),
                    backgroundColor:
                        state.wasIncremented ? Colors.green : Colors.redAccent,
                    duration: const Duration(milliseconds: 300),
                  ),
                );
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/second');
            },
            child: const Text('Second Page'),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
