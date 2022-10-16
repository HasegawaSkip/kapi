import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kapi/data/kavita/models/series/series.dart';
import 'package:kapi/data/kavita/repositories/series.repository.dart';

part 'series_state.dart';

class SeriesCubit extends Cubit<SeriesState> {
  final SeriesRepository _repository = SeriesRepository();
  SeriesCubit() : super(SeriesInitial());

  Future<void> getSeriesForLibrary(int libraryId) async {
    emit(SeriesLoading());
    List<Series> seriesList = await _repository.getSeriesForLibrary(libraryId);
    emit(SeriesLoaded(seriesList));
  }
}


  //   final LibraryRepository _repository = LibraryRepository();
  // LibraryCubit() : super(LibraryInitial());

  // Future<void> getLibraryNames() async {
  //   emit(LibraryLoading());
  //   List<LibraryDto> libraryNames = await _repository.getLibraryNames();
  //   emit(LibraryInfoLoaded(libraryNames));
  // }