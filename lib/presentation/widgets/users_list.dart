import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_demo/presentation/bloc/user_bloc.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.users.isEmpty) {
          if (state.status == UserStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status != UserStatus.success) {
            return const SizedBox();
          } else if (state.status == UserStatus.failure) {
            return const Text('Something is wrong!!!');
          }
        }
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                state.users[index].name,
                style: const TextStyle(fontSize: 25),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: state.users.length,
        );
      },
    );
  }
}
