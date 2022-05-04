part of 'user_bloc.dart';

enum UserStatus { initial, loading, success, failure }

class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.initial,
    this.users = const [],
    this.userInput = '',
  });

  final UserStatus status;
  final List<User> users;
  final String userInput;

  UserState copyWith({
    UserStatus? status,
    List<User>? users,
    String? userInput,
  }) =>
      UserState(
        status: status ?? this.status,
        users: users ?? this.users,
        userInput: userInput ?? this.userInput,
      );

  @override
  List<Object> get props => [status, users, userInput];
}
