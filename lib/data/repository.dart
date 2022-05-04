import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:stream_demo/data/some_data_source.dart';
import 'package:stream_demo/domain/models.dart';

class UserRepository {
  final SomeDataSource _dataSource;

  UserRepository(
    SomeDataSource dataSource,
  ) : _dataSource = dataSource {
    _dataSource.getUsers().then((users) => _userStreamController.add(users));
  }

  final _userStreamController = BehaviorSubject<List<User>>();

  /* If there are multiple listeners of this stream, then
     edit the `getUsers()` method as:
    
      Stream<List<User>> getUsers() => _userStreamController.asBroadcastStream();

  */
  Stream<List<User>> getUsers() => _userStreamController.stream;

  void addUser(User user) {
    final users = [..._userStreamController.value, user];
    /* Don't:

     _userStreamController.value.add(user);

     As it will add the new user to the previous List instance due to which
     the ListView in the UI will not update properly.
     So, we should return new List instance with updated values.
    
     Alternatively, we can also do:
     
     final users = List<User>.from(_userStreamController.value)..add(user);
     
     */
    _userStreamController.add(users);
  }
}
