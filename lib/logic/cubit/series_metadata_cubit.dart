import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kapi/data/kavita/models/series_metadata.dart';
import 'package:kapi/data/kavita/repositories/series_repository.dart';

part 'series_metadata_state.dart';

class SeriesMetadataCubit extends Cubit<SeriesMetadataState> {
  final SeriesRepository _repository = SeriesRepository();
  SeriesMetadataCubit() : super(SeriesMetadataInitial());

  Future<void> getMetadata(int seriesId) async {
    emit(SeriesMetadataLoading());
    SeriesMetadata seriesMetadata = await _repository.getMetadata(seriesId);
    emit(SeriesMetadataLoaded(seriesMetadata));
  }
}

//   final LibraryRepository _repository = LibraryRepository();
// LibraryCubit() : super(LibraryInitial());

// Future<void> getLibraryNames() async {
//   emit(LibraryLoading());
//   List<LibraryDto> libraryNames = await _repository.getLibraryNames();
//   emit(LibraryInfoLoaded(libraryNames));
// }
