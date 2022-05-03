import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_demo/data/repository.dart';
import 'package:stream_demo/data/some_data_source.dart';
import 'package:stream_demo/presentation/pages/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Demo',
      home: RepositoryProvider(
        create: (context) => UserRepository(const SomeDataSource()),
        child: const UserPage(),
      ),
    );
  }
}
