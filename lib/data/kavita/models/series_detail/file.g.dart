// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

File _$FileFromJson(Map<String, dynamic> json) => File(
      id: json['id'] as int?,
      filePath: json['filePath'] as String?,
      pages: json['pages'] as int?,
      format: json['format'] as int?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
      'id': instance.id,
      'filePath': instance.filePath,
      'pages': instance.pages,
      'format': instance.format,
      'created': instance.created?.toIso8601String(),
    };
