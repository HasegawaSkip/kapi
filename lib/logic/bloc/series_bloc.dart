import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:kapi/data/kavita/models/recently_added_item_dto/recently_added_item_dto.dart';
import 'package:kapi/data/kavita/repositories/series_repository.dart';

import '../../data/kavita/models/series/series.dart';

part 'series_event.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  // int libraryId;

  final SeriesRepository _repository = SeriesRepository();
  SeriesBloc(
      // this.libraryId,
      )
      : super(SeriesInitial()) {
    on<getRecentlyUpdatedSeriesEvent>((event, emit) async {
      emit(RecentlyUpdatedLoading());
      try {
        List<RecentlyAddedItemDto> recentlyAddedItemDto =
            await _repository.getRecentlyUpdatedSeries();
        emit(RecentlyUpdatedSeriesLoaded(recentlyAddedItemDto));
      } on Exception catch (_) {
        emit(SeriesError());
      }
    });

    on<getNewlyAddedSeriesEvent>((event, emit) async {
      emit(NewlyAddedLoading());
      try {
        List<Series> series = await _repository.getRecentlyAdded();
        emit(NewlyAddedSeriesLoaded(series));
      } on Exception catch (_) {
        emit(SeriesError());
      }
    });
  }
}
