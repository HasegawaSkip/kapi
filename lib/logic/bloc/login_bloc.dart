import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/kavita/models/loginDto.dart';
import '../../data/kavita/repositories/account_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AccountRepository _accountRepository;

  LoginBloc(
    this._accountRepository,
  ) : super(LoginInitial()) {
    on<LoadLoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final LoginDto loginDto =
            await _accountRepository.login(event.loginData);
        emit(LoginLoaded(loginDto));
      } on Exception catch (_) {
        emit(LoginError());
      }
    });
  }
}
