// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => LoginDto(
      username: json['username'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      apiKey: json['apiKey'] as String?,
      preferences: json['preferences'] == null
          ? null
          : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'apiKey': instance.apiKey,
      'preferences': instance.preferences,
    };
