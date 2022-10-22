import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'file.dart';

part 'storyline_chapter.g.dart';

@JsonSerializable()
class StorylineChapter extends Equatable {
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
  final DateTime? releaseDate;
  final String? titleName;
  final String? summary;
  final int? ageRating;
  final int? wordCount;
  final String? volumeTitle;
  final int? minHoursToRead;
  final int? maxHoursToRead;
  final int? avgHoursToRead;

  const StorylineChapter({
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

  factory StorylineChapter.fromJson(Map<String, dynamic> json) {
    return _$StorylineChapterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StorylineChapterToJson(this);

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
