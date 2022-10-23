import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kapi/data/kavita/repositories/image_repository.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository _repository = ImageRepository();

  ImageBloc() : super(ImageInitial()) {
    on<GetSeriesCoverImageEvent>((event, emit) async {
      emit(ImageLoading());
      try {
        String imageUrl = await _repository.getSeriesCoverImage(event.seriesId);
        emit(ImageLoaded(imageUrl));
      } on Exception catch (_) {
        emit(ImageError());
      }
    });

    on<GetVolumeCoverImageEvent>((event, emit) async {
      emit(ImageLoading());
      try {
        String imageUrl = await _repository.getVolumeCoverImage(event.volumeId);
        emit(ImageLoaded(imageUrl));
      } on Exception catch (_) {
        emit(ImageError());
      }
    });

    on<GetChapterCoverImageEvent>((event, emit) async {
      emit(ImageLoading());
      try {
        String imageUrl =
            await _repository.getChapterCoverImage(event.chapterId);
        emit(ImageLoaded(imageUrl));
      } on Exception catch (_) {
        emit(ImageError());
      }
    });
  }
}
