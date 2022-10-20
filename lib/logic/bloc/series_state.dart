part of 'series_bloc.dart';

abstract class SeriesState extends Equatable {
  const SeriesState();

  @override
  List<Object> get props => [];
}

class SeriesInitial extends SeriesState {}

class NewlyAddedLoading extends SeriesState {}

class RecentlyUpdatedLoading extends SeriesState {}

class RecentlyUpdatedSeriesLoaded extends SeriesState {
  final List<RecentlyAddedItemDto> recentlyAddedItemDto;

  const RecentlyUpdatedSeriesLoaded(
    this.recentlyAddedItemDto,
  );

  @override
  List<Object> get props => [recentlyAddedItemDto];
}

class NewlyAddedSeriesLoaded extends SeriesState {
  final List<Series> series;

  const NewlyAddedSeriesLoaded(
    this.series,
  );

  @override
  List<Object> get props => [series];
}

class SeriesError extends SeriesState {}
