import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kapi/data/kavita/models/libraryDto.dart';
import 'package:kapi/data/kavita/repositories/library_repository.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  final LibraryRepository _repository = LibraryRepository();
  LibraryCubit() : super(LibraryInitial());

  Future<void> getLibraryNames() async {
    emit(LibraryLoading());
    List<LibraryDto> libraryNames = await _repository.getLibraryNames();
    emit(LibraryInfoLoaded(libraryNames));
  }
}
