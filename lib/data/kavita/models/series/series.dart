import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'series.g.dart';

@JsonSerializable()
class Series extends Equatable {
  final int? id;
  final String? name;
  final String? originalName;
  final String? localizedName;
  final String? sortName;
  final dynamic summary;
  final int? pages;
  final bool? coverImageLocked;
  final int? pagesRead;
  final String? latestReadDate;
  final DateTime? lastChapterAdded;
  final int? userRating;
  final dynamic userReview;
  final int? format;
  final DateTime? created;
  final bool? nameLocked;
  final bool? sortNameLocked;
  final bool? localizedNameLocked;
  final int? wordCount;
  final int? libraryId;
  final String? libraryName;
  final int? minHoursToRead;
  final int? maxHoursToRead;
  final int? avgHoursToRead;
  final String? folderPath;
  final DateTime? lastFolderScanned;

  const Series({
    this.id,
    this.name,
    this.originalName,
    this.localizedName,
    this.sortName,
    this.summary,
    this.pages,
    this.coverImageLocked,
    this.pagesRead,
    this.latestReadDate,
    this.lastChapterAdded,
    this.userRating,
    this.userReview,
    this.format,
    this.created,
    this.nameLocked,
    this.sortNameLocked,
    this.localizedNameLocked,
    this.wordCount,
    this.libraryId,
    this.libraryName,
    this.minHoursToRead,
    this.maxHoursToRead,
    this.avgHoursToRead,
    this.folderPath,
    this.lastFolderScanned,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    return _$SeriesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SeriesToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      originalName,
      localizedName,
      sortName,
      summary,
      pages,
      coverImageLocked,
      pagesRead,
      latestReadDate,
      lastChapterAdded,
      userRating,
      userReview,
      format,
      created,
      nameLocked,
      sortNameLocked,
      localizedNameLocked,
      wordCount,
      libraryId,
      libraryName,
      minHoursToRead,
      maxHoursToRead,
      avgHoursToRead,
      folderPath,
      lastFolderScanned,
    ];
  }
}
