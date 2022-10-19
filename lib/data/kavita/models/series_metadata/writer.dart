import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'writer.g.dart';

@JsonSerializable()
class Writer extends Equatable {
  final int? id;
  final String? name;
  final int? role;

  const Writer({this.id, this.name, this.role});

  factory Writer.fromJson(Map<String, dynamic> json) {
    return _$WriterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WriterToJson(this);

  @override
  List<Object?> get props => [id, name, role];
}
