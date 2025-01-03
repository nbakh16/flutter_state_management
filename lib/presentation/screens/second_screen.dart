import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/logic/cubit/counter_cubit.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Counter')),
      backgroundColor: Colors.tealAccent,
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
      floatingActionButton: Row(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
