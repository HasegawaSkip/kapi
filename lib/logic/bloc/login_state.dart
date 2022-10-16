part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final LoginDto loginDto;

  const LoginLoaded(this.loginDto);
  @override
  List<Object> get props => [loginDto];
}

class LoginError extends LoginState {}
