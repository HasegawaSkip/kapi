// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storyline_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorylineChapter _$StorylineChapterFromJson(Map<String, dynamic> json) =>
    StorylineChapter(
      id: json['id'] as int?,
      range: json['range'] as String?,
      number: json['number'] as String?,
      pages: json['pages'] as int?,
      isSpecial: json['isSpecial'] as bool?,
      title: json['title'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => File.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagesRead: json['pagesRead'] as int?,
      coverImageLocked: json['coverImageLocked'] as bool?,
      volumeId: json['volumeId'] as int?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      titleName: json['titleName'] as String?,
      summary: json['summary'] as String?,
      ageRating: json['ageRating'] as int?,
      wordCount: json['wordCount'] as int?,
      volumeTitle: json['volumeTitle'] as String?,
      minHoursToRead: json['minHoursToRead'] as int?,
      maxHoursToRead: json['maxHoursToRead'] as int?,
      avgHoursToRead: json['avgHoursToRead'] as int?,
    );

Map<String, dynamic> _$StorylineChapterToJson(StorylineChapter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'range': instance.range,
      'number': instance.number,
      'pages': instance.pages,
      'isSpecial': instance.isSpecial,
      'title': instance.title,
      'files': instance.files,
      'pagesRead': instance.pagesRead,
      'coverImageLocked': instance.coverImageLocked,
      'volumeId': instance.volumeId,
      'created': instance.created?.toIso8601String(),
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'titleName': instance.titleName,
      'summary': instance.summary,
      'ageRating': instance.ageRating,
      'wordCount': instance.wordCount,
      'volumeTitle': instance.volumeTitle,
      'minHoursToRead': instance.minHoursToRead,
      'maxHoursToRead': instance.maxHoursToRead,
      'avgHoursToRead': instance.avgHoursToRead,
    };
