import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:stream_demo/data/some_data_source.dart';
import 'package:stream_demo/domain/models.dart';

class UserRepository {
  final SomeDataSource _dataSource;

  UserRepository(
    SomeDataSource dataSource,
  ) : _dataSource = dataSource {
    _addUsersToStream();
  }

  Future<void> _addUsersToStream() async {
    final users = await _dataSource.getUsers();
    _userStreamController.add(users);
  }

  final _userStreamController = BehaviorSubject<List<User>>();

  Stream<List<User>> getUsers() => _userStreamController.stream;

  void addUser(User user) {
    final users = [..._userStreamController.value, user];
    _userStreamController.add(users);
  }
}
