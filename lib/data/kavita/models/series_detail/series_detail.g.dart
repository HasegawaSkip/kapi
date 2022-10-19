// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesDetail _$SeriesDetailFromJson(Map<String, dynamic> json) => SeriesDetail(
      specials: json['specials'] as List<dynamic>?,
      chapters: json['chapters'] as List<dynamic>?,
      volumes: (json['volumes'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      storylineChapters: json['storylineChapters'] as List<dynamic>?,
    );

Map<String, dynamic> _$SeriesDetailToJson(SeriesDetail instance) =>
    <String, dynamic>{
      'specials': instance.specials,
      'chapters': instance.chapters,
      'volumes': instance.volumes,
      'storylineChapters': instance.storylineChapters,
    };
