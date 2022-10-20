import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recently_added_item_dto.g.dart';

@JsonSerializable()
class RecentlyAddedItemDto extends Equatable {
  final String? seriesName;
  final int? seriesId;
  final int? libraryId;
  final int? libraryType;
  final String? title;
  final DateTime? created;
  final int? chapterId;
  final int? volumeId;
  final int? id;
  final int? format;

  const RecentlyAddedItemDto({
    this.seriesName,
    this.seriesId,
    this.libraryId,
    this.libraryType,
    this.title,
    this.created,
    this.chapterId,
    this.volumeId,
    this.id,
    this.format,
  });

  factory RecentlyAddedItemDto.fromJson(Map<String, dynamic> json) {
    return _$RecentlyAddedItemDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecentlyAddedItemDtoToJson(this);

  @override
  List<Object?> get props {
    return [
      seriesName,
      seriesId,
      libraryId,
      libraryType,
      title,
      created,
      chapterId,
      volumeId,
      id,
      format,
    ];
  }
}
