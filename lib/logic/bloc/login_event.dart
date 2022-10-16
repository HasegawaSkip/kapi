part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoadLoginEvent extends LoginEvent {
  final Map<String, dynamic> loginData;

  const LoadLoginEvent({
    required this.loginData,
  });

  @override
  List<Object> get props => [loginData];
}
