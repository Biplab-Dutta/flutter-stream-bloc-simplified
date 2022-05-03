part of 'user_bloc.dart';

enum UserStatus { initial, loading, success, failure }

class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.initial,
    this.users = const [],
  });

  final UserStatus status;
  final List<User> users;

  UserState copyWith({
    UserStatus? status,
    List<User>? users,
  }) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }

  @override
  List<Object> get props => [status, users];
}
