// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Theme _$ThemeFromJson(Map<String, dynamic> json) => Theme(
      id: json['id'] as int?,
      name: json['name'] as String?,
      normalizedName: json['normalizedName'] as String?,
      fileName: json['fileName'] as String?,
      isDefault: json['isDefault'] as bool?,
      provider: json['provider'] as int?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      lastModified: json['lastModified'] == null
          ? null
          : DateTime.parse(json['lastModified'] as String),
    );

Map<String, dynamic> _$ThemeToJson(Theme instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'normalizedName': instance.normalizedName,
      'fileName': instance.fileName,
      'isDefault': instance.isDefault,
      'provider': instance.provider,
      'created': instance.created?.toIso8601String(),
      'lastModified': instance.lastModified?.toIso8601String(),
    };
