import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_demo/data/repository.dart';
import 'package:stream_demo/domain/models.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required UserRepository repository,
  })  : _repository = repository,
        super(const UserState()) {
    on<UserRequested>(_onUserRequested);
    on<UserAdded>(_onUserAdded);
    on<UserInputChanged>(_onUserInput);
  }

  final UserRepository _repository;

  Future<void> _onUserRequested(
    UserRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));

    /// We also could have used `stream.listen` however `emit.forEach()` is a
    /// newer and recommended approach when working with the flutter_bloc package.

    await emit.forEach<List<User>>(
      _repository.getUsers(),
      onData: (users) => state.copyWith(
        status: UserStatus.success,
        users: users,
      ),
      onError: (_, __) => state.copyWith(status: UserStatus.failure),
    );
  }

  void _onUserAdded(
    UserAdded event,
    Emitter<UserState> emit,
  ) {
    _repository.addUser(event.user);
    emit(state.copyWith(userInput: ''));
  }

  void _onUserInput(
    UserInputChanged event,
    Emitter<UserState> emit,
  ) {
    emit(
      state.copyWith(
        userInput: event.input,
      ),
    );
  }
}
