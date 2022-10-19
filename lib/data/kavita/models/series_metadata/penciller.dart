import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'penciller.g.dart';

@JsonSerializable()
class Penciller extends Equatable {
  final int? id;
  final String? name;
  final int? role;

  const Penciller({this.id, this.name, this.role});

  factory Penciller.fromJson(Map<String, dynamic> json) {
    return _$PencillerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PencillerToJson(this);

  @override
  List<Object?> get props => [id, name, role];
}
