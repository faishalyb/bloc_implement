import 'package:bloc_implement/bloc/counter_event.dart';
import 'package:bloc_implement/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(number: 0)) {
    on<OnCounterIncrement>((event, emit) {
      emit(CounterIncrement(number: state.number + 1));
    });

    on<OnCounterDecrement>((event, emit) {
      if (state.number > 0) emit(CounterIncrement(number: state.number - 1));
    });
  }
}
