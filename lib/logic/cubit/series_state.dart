part of 'series_cubit.dart';

abstract class SeriesState extends Equatable {
  const SeriesState();

  @override
  List<Object> get props => [];
}

class SeriesInitial extends SeriesState {}

class SeriesLoading extends SeriesState {}

class SeriesLoaded extends SeriesState {
  final List<Series> seriesList;
  const SeriesLoaded(this.seriesList);

  @override
  List<Object> get props => [seriesList];
}
