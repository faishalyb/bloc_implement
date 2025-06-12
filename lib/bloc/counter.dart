import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  Counter() : super(0);

  increment() => emit(state + 1);
  decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}
