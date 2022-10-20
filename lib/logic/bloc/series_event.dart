part of 'series_bloc.dart';

abstract class SeriesEvent extends Equatable {
  const SeriesEvent();

  @override
  List<Object> get props => [];
}

class getRecentlyUpdatedSeriesEvent extends SeriesEvent {}

class getNewlyAddedSeriesEvent extends SeriesEvent {}
