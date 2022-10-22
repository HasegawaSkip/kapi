import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'chapter.dart';
import 'special.dart';
import 'storyline_chapter.dart';
import 'volume.dart';

part 'series_detail.g.dart';

@JsonSerializable()
class SeriesDetail extends Equatable {
  final List<Special>? specials;
  final List<Chapter>? chapters;
  final List<Volume>? volumes;
  final List<StorylineChapter>? storylineChapters;

  const SeriesDetail({
    this.specials,
    this.chapters,
    this.volumes,
    this.storylineChapters,
  });

  factory SeriesDetail.fromJson(Map<String, dynamic> json) {
    return _$SeriesDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SeriesDetailToJson(this);

  @override
  List<Object?> get props {
    return [
      specials,
      chapters,
      volumes,
      storylineChapters,
    ];
  }
}
