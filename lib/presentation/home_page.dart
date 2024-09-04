import 'package:bloc_implement/bloc/user_bloc.dart';
import 'package:bloc_implement/data/datasource/remote_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(remoteDatasource: RemoteDatasource())..add(LoadUser()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Selamat Datang!'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserError) {
              return Center(child: Text(state.error));
            } else if (state is UserLoaded) {
              final data = state.users;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data[index].avatar),
                    ),
                    title: Text(
                        '${data[index].firstname} ${data[index].lastname}'),
                    subtitle: Text(data[index].email),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
