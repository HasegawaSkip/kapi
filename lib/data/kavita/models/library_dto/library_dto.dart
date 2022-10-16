import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'library_dto.g.dart';

@JsonSerializable()
class LibraryDto extends Equatable {
  final int? id;
  final String? name;
  final DateTime? lastScanned;
  final int? type;
  final List<String>? folders;

  const LibraryDto({
    this.id,
    this.name,
    this.lastScanned,
    this.type,
    this.folders,
  });

  factory LibraryDto.fromJson(Map<String, dynamic> json) {
    return _$LibraryDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LibraryDtoToJson(this);

  @override
  List<Object?> get props => [id, name, lastScanned, type, folders];
}
