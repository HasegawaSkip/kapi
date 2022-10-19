// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesMetadata _$SeriesMetadataFromJson(Map<String, dynamic> json) =>
    SeriesMetadata(
      id: json['id'] as int?,
      summary: json['summary'] as String?,
      collectionTags: json['collectionTags'] as List<dynamic>?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      writers: (json['writers'] as List<dynamic>?)
          ?.map((e) => Writer.fromJson(e as Map<String, dynamic>))
          .toList(),
      coverArtists: json['coverArtists'] as List<dynamic>?,
      publishers: json['publishers'] as List<dynamic>?,
      characters: json['characters'] as List<dynamic>?,
      pencillers: (json['pencillers'] as List<dynamic>?)
          ?.map((e) => Penciller.fromJson(e as Map<String, dynamic>))
          .toList(),
      inkers: json['inkers'] as List<dynamic>?,
      colorists: json['colorists'] as List<dynamic>?,
      letterers: json['letterers'] as List<dynamic>?,
      editors: json['editors'] as List<dynamic>?,
      translators: json['translators'] as List<dynamic>?,
      ageRating: json['ageRating'] as int?,
      releaseYear: json['releaseYear'] as int?,
      language: json['language'] as String?,
      maxCount: json['maxCount'] as int?,
      totalCount: json['totalCount'] as int?,
      publicationStatus: json['publicationStatus'] as int?,
      languageLocked: json['languageLocked'] as bool?,
      summaryLocked: json['summaryLocked'] as bool?,
      ageRatingLocked: json['ageRatingLocked'] as bool?,
      publicationStatusLocked: json['publicationStatusLocked'] as bool?,
      genresLocked: json['genresLocked'] as bool?,
      tagsLocked: json['tagsLocked'] as bool?,
      writersLocked: json['writersLocked'] as bool?,
      charactersLocked: json['charactersLocked'] as bool?,
      coloristsLocked: json['coloristsLocked'] as bool?,
      editorsLocked: json['editorsLocked'] as bool?,
      inkersLocked: json['inkersLocked'] as bool?,
      letterersLocked: json['letterersLocked'] as bool?,
      pencillersLocked: json['pencillersLocked'] as bool?,
      publishersLocked: json['publishersLocked'] as bool?,
      translatorsLocked: json['translatorsLocked'] as bool?,
      coverArtistsLocked: json['coverArtistsLocked'] as bool?,
      seriesId: json['seriesId'] as int?,
    );

Map<String, dynamic> _$SeriesMetadataToJson(SeriesMetadata instance) =>
    <String, dynamic>{
      'id': instance.id,
      'summary': instance.summary,
      'collectionTags': instance.collectionTags,
      'genres': instance.genres,
      'tags': instance.tags,
      'writers': instance.writers,
      'coverArtists': instance.coverArtists,
      'publishers': instance.publishers,
      'characters': instance.characters,
      'pencillers': instance.pencillers,
      'inkers': instance.inkers,
      'colorists': instance.colorists,
      'letterers': instance.letterers,
      'editors': instance.editors,
      'translators': instance.translators,
      'ageRating': instance.ageRating,
      'releaseYear': instance.releaseYear,
      'language': instance.language,
      'maxCount': instance.maxCount,
      'totalCount': instance.totalCount,
      'publicationStatus': instance.publicationStatus,
      'languageLocked': instance.languageLocked,
      'summaryLocked': instance.summaryLocked,
      'ageRatingLocked': instance.ageRatingLocked,
      'publicationStatusLocked': instance.publicationStatusLocked,
      'genresLocked': instance.genresLocked,
      'tagsLocked': instance.tagsLocked,
      'writersLocked': instance.writersLocked,
      'charactersLocked': instance.charactersLocked,
      'coloristsLocked': instance.coloristsLocked,
      'editorsLocked': instance.editorsLocked,
      'inkersLocked': instance.inkersLocked,
      'letterersLocked': instance.letterersLocked,
      'pencillersLocked': instance.pencillersLocked,
      'publishersLocked': instance.publishersLocked,
      'translatorsLocked': instance.translatorsLocked,
      'coverArtistsLocked': instance.coverArtistsLocked,
      'seriesId': instance.seriesId,
    };
