import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'chapter.dart';

part 'volume.g.dart';

@JsonSerializable()
class Volume extends Equatable {
  final int? id;
  final int? number;
  final String? name;
  final int? pages;
  final int? pagesRead;
  final DateTime? lastModified;
  final DateTime? created;
  final int? seriesId;
  final List<Chapter>? chapters;
  final int? minHoursToRead;
  final int? maxHoursToRead;
  final int? avgHoursToRead;

  const Volume({
    this.id,
    this.number,
    this.name,
    this.pages,
    this.pagesRead,
    this.lastModified,
    this.created,
    this.seriesId,
    this.chapters,
    this.minHoursToRead,
    this.maxHoursToRead,
    this.avgHoursToRead,
  });

  factory Volume.fromJson(Map<String, dynamic> json) {
    return _$VolumeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VolumeToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      number,
      name,
      pages,
      pagesRead,
      lastModified,
      created,
      seriesId,
      chapters,
      minHoursToRead,
      maxHoursToRead,
      avgHoursToRead,
    ];
  }
}
