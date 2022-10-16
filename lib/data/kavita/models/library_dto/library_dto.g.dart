// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LibraryDto _$LibraryDtoFromJson(Map<String, dynamic> json) => LibraryDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      lastScanned: json['lastScanned'] == null
          ? null
          : DateTime.parse(json['lastScanned'] as String),
      type: json['type'] as int?,
      folders:
          (json['folders'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LibraryDtoToJson(LibraryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastScanned': instance.lastScanned?.toIso8601String(),
      'type': instance.type,
      'folders': instance.folders,
    };
