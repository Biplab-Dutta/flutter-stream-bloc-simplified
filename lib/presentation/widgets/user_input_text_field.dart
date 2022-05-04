import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_demo/presentation/bloc/user_bloc.dart';

class UserInputTextField extends StatelessWidget {
  const UserInputTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        label: Text('Add User'),
      ),
      onChanged: (input) {
        context.read<UserBloc>().add(UserInputChanged(input));
      },
    );
  }
}
