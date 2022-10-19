import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'file.dart';

part 'chapter.g.dart';

@JsonSerializable()
class Chapter extends Equatable {
  final int? id;
  final String? range;
  final String? number;
  final int? pages;
  final bool? isSpecial;
  final String? title;
  final List<File>? files;
  final int? pagesRead;
  final bool? coverImageLocked;
  final int? volumeId;
  final DateTime? created;
  final String? releaseDate;
  final String? titleName;
  final dynamic summary;
  final int? ageRating;
  final int? wordCount;
  final String? volumeTitle;
  final int? minHoursToRead;
  final int? maxHoursToRead;
  final int? avgHoursToRead;

  const Chapter({
    this.id,
    this.range,
    this.number,
    this.pages,
    this.isSpecial,
    this.title,
    this.files,
    this.pagesRead,
    this.coverImageLocked,
    this.volumeId,
    this.created,
    this.releaseDate,
    this.titleName,
    this.summary,
    this.ageRating,
    this.wordCount,
    this.volumeTitle,
    this.minHoursToRead,
    this.maxHoursToRead,
    this.avgHoursToRead,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return _$ChapterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChapterToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      range,
      number,
      pages,
      isSpecial,
      title,
      files,
      pagesRead,
      coverImageLocked,
      volumeId,
      created,
      releaseDate,
      titleName,
      summary,
      ageRating,
      wordCount,
      volumeTitle,
      minHoursToRead,
      maxHoursToRead,
      avgHoursToRead,
    ];
  }
}
