import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
import 'penciller.dart';
import 'tag.dart';
import 'writer.dart';

part 'series_metadata.g.dart';

@JsonSerializable()
class SeriesMetadata extends Equatable {
  final int? id;
  final String? summary;
  final List<dynamic>? collectionTags;
  final List<Genre>? genres;
  final List<Tag>? tags;
  final List<Writer>? writers;
  final List<dynamic>? coverArtists;
  final List<dynamic>? publishers;
  final List<dynamic>? characters;
  final List<Penciller>? pencillers;
  final List<dynamic>? inkers;
  final List<dynamic>? colorists;
  final List<dynamic>? letterers;
  final List<dynamic>? editors;
  final List<dynamic>? translators;
  final int? ageRating;
  final int? releaseYear;
  final String? language;
  final int? maxCount;
  final int? totalCount;
  final int? publicationStatus;
  final bool? languageLocked;
  final bool? summaryLocked;
  final bool? ageRatingLocked;
  final bool? publicationStatusLocked;
  final bool? genresLocked;
  final bool? tagsLocked;
  final bool? writersLocked;
  final bool? charactersLocked;
  final bool? coloristsLocked;
  final bool? editorsLocked;
  final bool? inkersLocked;
  final bool? letterersLocked;
  final bool? pencillersLocked;
  final bool? publishersLocked;
  final bool? translatorsLocked;
  final bool? coverArtistsLocked;
  final int? seriesId;

  const SeriesMetadata({
    this.id,
    this.summary,
    this.collectionTags,
    this.genres,
    this.tags,
    this.writers,
    this.coverArtists,
    this.publishers,
    this.characters,
    this.pencillers,
    this.inkers,
    this.colorists,
    this.letterers,
    this.editors,
    this.translators,
    this.ageRating,
    this.releaseYear,
    this.language,
    this.maxCount,
    this.totalCount,
    this.publicationStatus,
    this.languageLocked,
    this.summaryLocked,
    this.ageRatingLocked,
    this.publicationStatusLocked,
    this.genresLocked,
    this.tagsLocked,
    this.writersLocked,
    this.charactersLocked,
    this.coloristsLocked,
    this.editorsLocked,
    this.inkersLocked,
    this.letterersLocked,
    this.pencillersLocked,
    this.publishersLocked,
    this.translatorsLocked,
    this.coverArtistsLocked,
    this.seriesId,
  });

  factory SeriesMetadata.fromJson(Map<String, dynamic> json) {
    return _$SeriesMetadataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SeriesMetadataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      summary,
      collectionTags,
      genres,
      tags,
      writers,
      coverArtists,
      publishers,
      characters,
      pencillers,
      inkers,
      colorists,
      letterers,
      editors,
      translators,
      ageRating,
      releaseYear,
      language,
      maxCount,
      totalCount,
      publicationStatus,
      languageLocked,
      summaryLocked,
      ageRatingLocked,
      publicationStatusLocked,
      genresLocked,
      tagsLocked,
      writersLocked,
      charactersLocked,
      coloristsLocked,
      editorsLocked,
      inkersLocked,
      letterersLocked,
      pencillersLocked,
      publishersLocked,
      translatorsLocked,
      coverArtistsLocked,
      seriesId,
    ];
  }
}
