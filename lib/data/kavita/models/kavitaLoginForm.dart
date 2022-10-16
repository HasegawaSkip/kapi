import 'package:json_annotation/json_annotation.dart';

part 'kavitaLoginForm.g.dart';

@JsonSerializable()
class LoginForm {
  final String name;
  final String url;
  final String username;
  final String password;

  LoginForm(
      {required this.name,
      required this.url,
      required this.username,
      required this.password});

  factory LoginForm.fromJson(Map<String, dynamic> json) {
    return _$LoginFormFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginFormToJson(this);
}
