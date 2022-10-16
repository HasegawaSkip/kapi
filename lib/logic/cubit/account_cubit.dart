import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kapi/data/kavita/models/loginDto.dart';
import '../../data/kavita/repositories/account_repository.dart';
import '../../data/kavita/models/kavitaUser.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountRepository _repository;

  AccountCubit(this._repository) : super(AccountInitial());

  Future<void> login(loginData) async {
    emit(AccountLoading());
    try {
      final LoginDto loginDto = await _repository.login(loginData);
      final KavitaUser user = KavitaUser(
          username: loginDto.username.toString(),
          token: loginDto.token.toString(),
          refreshToken: loginDto.refreshToken.toString(),
          // preferences: loginDto.preferences!,
          apiKey: loginDto.apiKey.toString(),
          email: loginDto.email.toString());
      // await setCurrentUser(user);
      emit(AccountLoaded(user));
    } on Exception catch (_) {
      emit(AccountError());
    }
  }

  Future<void> setCurrentUser(KavitaUser user) async {
    emit(AccountInitial());
    await _repository.setCurrentUser(user);
    emit(AccountReady());
  }
}
