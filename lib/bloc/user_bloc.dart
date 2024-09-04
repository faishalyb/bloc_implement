import 'package:bloc_implement/data/datasource/remote_datasource.dart';
import 'package:bloc_implement/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RemoteDatasource remoteDatasource;

  UserBloc({required this.remoteDatasource}) : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      emit(UserLoading());
      try {
        final result = await remoteDatasource.getUsers();
        emit(UserLoaded(result.data));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
