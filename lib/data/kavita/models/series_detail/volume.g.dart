// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Volume _$VolumeFromJson(Map<String, dynamic> json) => Volume(
      id: json['id'] as int?,
      number: json['number'] as int?,
      name: json['name'] as String?,
      pages: json['pages'] as int?,
      pagesRead: json['pagesRead'] as int?,
      lastModified: json['lastModified'] == null
          ? null
          : DateTime.parse(json['lastModified'] as String),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      seriesId: json['seriesId'] as int?,
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      minHoursToRead: json['minHoursToRead'] as int?,
      maxHoursToRead: json['maxHoursToRead'] as int?,
      avgHoursToRead: json['avgHoursToRead'] as int?,
    );

Map<String, dynamic> _$VolumeToJson(Volume instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'name': instance.name,
      'pages': instance.pages,
      'pagesRead': instance.pagesRead,
      'lastModified': instance.lastModified?.toIso8601String(),
      'created': instance.created?.toIso8601String(),
      'seriesId': instance.seriesId,
      'chapters': instance.chapters,
      'minHoursToRead': instance.minHoursToRead,
      'maxHoursToRead': instance.maxHoursToRead,
      'avgHoursToRead': instance.avgHoursToRead,
    };
