// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_added_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentlyAddedItemDto _$RecentlyAddedItemDtoFromJson(
        Map<String, dynamic> json) =>
    RecentlyAddedItemDto(
      seriesName: json['seriesName'] as String?,
      seriesId: json['seriesId'] as int?,
      libraryId: json['libraryId'] as int?,
      libraryType: json['libraryType'] as int?,
      title: json['title'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      chapterId: json['chapterId'] as int?,
      volumeId: json['volumeId'] as int?,
      id: json['id'] as int?,
      format: json['format'] as int?,
    );

Map<String, dynamic> _$RecentlyAddedItemDtoToJson(
        RecentlyAddedItemDto instance) =>
    <String, dynamic>{
      'seriesName': instance.seriesName,
      'seriesId': instance.seriesId,
      'libraryId': instance.libraryId,
      'libraryType': instance.libraryType,
      'title': instance.title,
      'created': instance.created?.toIso8601String(),
      'chapterId': instance.chapterId,
      'volumeId': instance.volumeId,
      'id': instance.id,
      'format': instance.format,
    };
