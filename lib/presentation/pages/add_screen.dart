import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_demo/domain/models.dart';
import 'package:stream_demo/presentation/bloc/user_bloc.dart';
import 'package:stream_demo/presentation/widgets/user_input_text_field.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('triggered');
    // final state = context.watch<UserBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add user'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: UserInputTextField(),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              final state = context.read<UserBloc>().state;
              if (state.userInput.isNotEmpty) {
                context.read<UserBloc>().add(
                      UserAdded(
                        User(state.userInput),
                      ),
                    );
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
