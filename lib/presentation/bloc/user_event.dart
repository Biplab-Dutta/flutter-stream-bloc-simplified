part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserRequested extends UserEvent {
  const UserRequested();
}

class UserAdded extends UserEvent {
  const UserAdded(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class UserInputChanged extends UserEvent {
  const UserInputChanged(this.input);

  final String input;

  @override
  List<Object> get props => [input];
}
