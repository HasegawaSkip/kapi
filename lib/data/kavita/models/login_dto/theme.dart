import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'theme.g.dart';

@JsonSerializable()
class Theme extends Equatable {
  final int? id;
  final String? name;
  final String? normalizedName;
  final String? fileName;
  final bool? isDefault;
  final int? provider;
  final DateTime? created;
  final DateTime? lastModified;

  const Theme({
    this.id,
    this.name,
    this.normalizedName,
    this.fileName,
    this.isDefault,
    this.provider,
    this.created,
    this.lastModified,
  });

  factory Theme.fromJson(Map<String, dynamic> json) => _$ThemeFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      normalizedName,
      fileName,
      isDefault,
      provider,
      created,
      lastModified,
    ];
  }
}
