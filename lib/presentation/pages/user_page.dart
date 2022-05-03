import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_demo/data/repository.dart';
import 'package:stream_demo/presentation/bloc/user_bloc.dart';
import 'package:stream_demo/presentation/pages/add_screen.dart';
import 'package:stream_demo/presentation/widgets/users_list.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        repository: context.read<UserRepository>(),
      )..add(const UserRequested()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: const UsersList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return BlocProvider.value(
                  value: UserBloc(repository: context.read<UserRepository>()),
                  child: const AddScreen(),
                );
              },
            ),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
