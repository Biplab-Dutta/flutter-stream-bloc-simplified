import 'package:flutter/material.dart';

class UserInputTextField extends StatefulWidget {
  const UserInputTextField({
    required this.inputString,
    Key? key,
  }) : super(key: key);

  final void Function(String name) inputString;

  @override
  State<UserInputTextField> createState() => _UserInputTextFieldState();
}

class _UserInputTextFieldState extends State<UserInputTextField> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        label: Text('Add User'),
      ),
      onChanged: (input) {
        final name = input;
        widget.inputString(name);
      },
    );
  }
}
