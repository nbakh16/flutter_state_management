import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/logic/cubit/counter_cubit.dart';
import 'package:flutter_state_management/presentation/screens/second_screen.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        //BlocConsumer = BlocBuilder and BlocListener
        child: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text(state.wasIncremented ? 'Incremented' : 'Decremented'),
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    //this provider is optional on version 8
                    value: BlocProvider.of<CounterCubit>(context),
                    child: const SecondScreen(),
                  ),
                ),
              );
            },
            child: const Text('Second Page'),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
