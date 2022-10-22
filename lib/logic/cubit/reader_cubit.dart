// import 'dart:convert';
// import 'dart:typed_data';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kapi/data/kavita/repositories/reader_repository.dart';

part 'reader_state.dart';

class ReaderCubit extends Cubit<ReaderState> {
  final ReaderRepository _repository = ReaderRepository();
  ReaderCubit() : super(ReaderInitial());

  Future getPageUrl({required int chapterId, required int page}) async {
    emit(ReaderLoading());
    List<int> image =
        await _repository.getPageUrl(chapterId: chapterId, page: page);

    return emit(
        ReaderLoaded(Uint8List.fromList(image))); // Uint8List.fromList(image)
  }
}
