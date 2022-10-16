// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Series _$SeriesFromJson(Map<String, dynamic> json) => Series(
      id: json['id'] as int?,
      name: json['name'] as String?,
      originalName: json['originalName'] as String?,
      localizedName: json['localizedName'] as String?,
      sortName: json['sortName'] as String?,
      summary: json['summary'],
      pages: json['pages'] as int?,
      coverImageLocked: json['coverImageLocked'] as bool?,
      pagesRead: json['pagesRead'] as int?,
      latestReadDate: json['latestReadDate'] as String?,
      lastChapterAdded: json['lastChapterAdded'] == null
          ? null
          : DateTime.parse(json['lastChapterAdded'] as String),
      userRating: json['userRating'] as int?,
      userReview: json['userReview'],
      format: json['format'] as int?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      nameLocked: json['nameLocked'] as bool?,
      sortNameLocked: json['sortNameLocked'] as bool?,
      localizedNameLocked: json['localizedNameLocked'] as bool?,
      wordCount: json['wordCount'] as int?,
      libraryId: json['libraryId'] as int?,
      libraryName: json['libraryName'] as String?,
      minHoursToRead: json['minHoursToRead'] as int?,
      maxHoursToRead: json['maxHoursToRead'] as int?,
      avgHoursToRead: json['avgHoursToRead'] as int?,
      folderPath: json['folderPath'] as String?,
      lastFolderScanned: json['lastFolderScanned'] == null
          ? null
          : DateTime.parse(json['lastFolderScanned'] as String),
    );

Map<String, dynamic> _$SeriesToJson(Series instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'originalName': instance.originalName,
      'localizedName': instance.localizedName,
      'sortName': instance.sortName,
      'summary': instance.summary,
      'pages': instance.pages,
      'coverImageLocked': instance.coverImageLocked,
      'pagesRead': instance.pagesRead,
      'latestReadDate': instance.latestReadDate,
      'lastChapterAdded': instance.lastChapterAdded?.toIso8601String(),
      'userRating': instance.userRating,
      'userReview': instance.userReview,
      'format': instance.format,
      'created': instance.created?.toIso8601String(),
      'nameLocked': instance.nameLocked,
      'sortNameLocked': instance.sortNameLocked,
      'localizedNameLocked': instance.localizedNameLocked,
      'wordCount': instance.wordCount,
      'libraryId': instance.libraryId,
      'libraryName': instance.libraryName,
      'minHoursToRead': instance.minHoursToRead,
      'maxHoursToRead': instance.maxHoursToRead,
      'avgHoursToRead': instance.avgHoursToRead,
      'folderPath': instance.folderPath,
      'lastFolderScanned': instance.lastFolderScanned?.toIso8601String(),
    };
