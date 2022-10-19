import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'volume.dart';

part 'series_detail.g.dart';

@JsonSerializable()
class SeriesDetail extends Equatable {
  final List<dynamic>? specials;
  final List<dynamic>? chapters;
  final List<Volume>? volumes;
  final List<dynamic>? storylineChapters;

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
