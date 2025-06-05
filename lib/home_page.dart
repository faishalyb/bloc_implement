import 'package:bloc_implement/bloc/counter_bloc.dart';
import 'package:bloc_implement/bloc/counter_event.dart';
import 'package:bloc_implement/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // untuk menggunakan fungsi dari cubit bloc nya, bisa menggunakan fungsi context.read seperti diatas dengan fungsi yang samanya adalah listen : false
  // fungsi diatas sama dengan fungsi dibawah:
  // BlocProvider.of<CounterCubit>(context, listen: false).increment();
  // namun untuk membuat listen: true, kita butuh:
  // context.watch()

  // void _incrementCounter() {
  //   context.read<CounterCubit>().increment();
  // }

  // void _decrementCounter() {
  //   context.read<CounterCubit>().decrement();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.number}',
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: OverflowBar(
        children: [
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              // context.read<CounterCubit>().decrement();
              context.read<CounterBloc>().add(OnCounterDecrement());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              context.read<CounterBloc>().add(OnCounterIncrement());
            },
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
