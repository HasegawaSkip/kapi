import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'preferences.dart';

part 'login_dto.g.dart';

@JsonSerializable()
class LoginDto extends Equatable {
  final String? username;
  final String? email;
  final String? token;
  final String? refreshToken;
  final String? apiKey;
  final Preferences? preferences;

  const LoginDto({
    this.username,
    this.email,
    this.token,
    this.refreshToken,
    this.apiKey,
    this.preferences,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return _$LoginDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  @override
  List<Object?> get props {
    return [
      username,
      email,
      token,
      refreshToken,
      apiKey,
      preferences,
    ];
  }
}
