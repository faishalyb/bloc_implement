import 'package:bloc_implement/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  Counter myCounter = Counter();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Bloc Builder"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<Counter, int>(
              bloc: myCounter,
              // buildWhen: (prev, current) {
              //   if (current % 2 == 0) {
              //     return true;
              //   } else {
              //     return false;
              //   }
              // },
              builder: (context, state) {
                return Text(
                  "$state",
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                );
              }),
          // StreamBuilder(
          //     initialData: myCounter.init,
          //     stream: myCounter.stream,
          //     builder: (context, snapshot) {
          //       return Text(
          //         "${snapshot.data}",
          //         style: const TextStyle(
          //           fontSize: 50,
          //         ),
          //       );
          //     }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  myCounter.decrement();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  myCounter.increment();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
