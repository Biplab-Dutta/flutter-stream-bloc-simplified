import 'package:flutter/material.dart';
import 'package:stream_demo/presentation/pages/add_screen.dart';
import 'package:stream_demo/presentation/widgets/users_list.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: const UsersList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return const AddScreen();
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
