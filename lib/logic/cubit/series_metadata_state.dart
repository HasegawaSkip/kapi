part of 'series_metadata_cubit.dart';

abstract class SeriesMetadataState extends Equatable {
  const SeriesMetadataState();

  @override
  List<Object> get props => [];
}

class SeriesMetadataInitial extends SeriesMetadataState {}

class SeriesMetadataLoading extends SeriesMetadataState {}

class SeriesMetadataLoaded extends SeriesMetadataState {
  final SeriesMetadata seriesMetadata;
  const SeriesMetadataLoaded(this.seriesMetadata);

  @override
  List<Object> get props => [seriesMetadata];
}
