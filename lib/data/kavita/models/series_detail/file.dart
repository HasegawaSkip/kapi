import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';

@JsonSerializable()
class File extends Equatable {
  final int? id;
  final String? filePath;
  final int? pages;
  final int? format;
  final DateTime? created;

  const File({
    this.id,
    this.filePath,
    this.pages,
    this.format,
    this.created,
  });

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);

  @override
  List<Object?> get props => [id, filePath, pages, format, created];
}
