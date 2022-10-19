import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kapi/data/kavita/models/series_detail.dart';
import 'package:kapi/data/kavita/repositories/series_repository.dart';

part 'series_detail_state.dart';

class SeriesDetailCubit extends Cubit<SeriesDetailState> {
  final SeriesRepository _repository = SeriesRepository();
  SeriesDetailCubit() : super(SeriesDetailInitial());

  Future<void> getDetail(int seriesId) async {
    emit(SeriesDetailLoading());
    SeriesDetail seriesDetail = await _repository.getSeriesDetail(seriesId);
    emit(SeriesDetailLoaded(seriesDetail));
  }
}

//   final LibraryRepository _repository = LibraryRepository();
// LibraryCubit() : super(LibraryInitial());

// Future<void> getLibraryNames() async {
//   emit(LibraryLoading());
//   List<LibraryDto> libraryNames = await _repository.getLibraryNames();
//   emit(LibraryInfoLoaded(libraryNames));
// }
