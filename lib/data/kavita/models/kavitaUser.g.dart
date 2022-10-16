// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kavitaUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KavitaUser _$KavitaUserFromJson(Map<String, dynamic> json) => KavitaUser(
      username: json['username'] as String,
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      apiKey: json['apiKey'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$KavitaUserToJson(KavitaUser instance) =>
    <String, dynamic>{
      'username': instance.username,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'apiKey': instance.apiKey,
      'email': instance.email,
    };
