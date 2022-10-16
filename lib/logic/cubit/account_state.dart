part of 'account_cubit.dart';

abstract class AccountState extends Equatable {
  const AccountState();
  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final KavitaUser user;

  const AccountLoaded(this.user);
  @override
  List<Object> get props => [user];
}

class AccountError extends AccountState {}

class AccountReady extends AccountState {}
