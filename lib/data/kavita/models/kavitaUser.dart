import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '..//models/login_dto/preferences.dart';

part 'kavitaUser.g.dart';

@JsonSerializable()
class KavitaUser extends Equatable {
  final String username;
  final String token;
  final String refreshToken;
  // final List<String> roles;
  // final Preferences preferences;
  final String apiKey;
  final String email;
  // final String ageRestriction;

  const KavitaUser(
      {required this.username,
      required this.token,
      required this.refreshToken,
      // required this.preferences,
      required this.apiKey,
      required this.email});
  // username: string;
  // token: string;
  // refreshToken: string;
  // roles: string[];
  // preferences: Preferences;
  // apiKey: string;
  // email: string;
  // ageRestriction: AgeRating;

  factory KavitaUser.fromJson(Map<String, dynamic> json) {
    return _$KavitaUserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KavitaUserToJson(this);

  @override
  List<Object?> get props {
    return [
      username,
      email,
      token,
      refreshToken,
      apiKey,
      // preferences,
    ];
  }
}
