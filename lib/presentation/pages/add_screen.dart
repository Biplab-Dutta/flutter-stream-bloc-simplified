import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_demo/domain/models.dart';
import 'package:stream_demo/presentation/bloc/user_bloc.dart';
import 'package:stream_demo/presentation/widgets/user_input_text_field.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add user'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: UserInputTextField(
              inputString: (name) {
                this.name = name;
              },
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                if (name != null) {
                  context.read<UserBloc>().add(UserAdded(User(name!)));
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add')),
        ],
      ),
    );
  }
}
