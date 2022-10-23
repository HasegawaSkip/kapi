import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kapi/data/kavita/repositories/image_repository.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  final ImageRepository _repository = ImageRepository();
  ImageCubit() : super(ImageInitial());

  Future getSeriesCoverImage(int seriesId) async {
    emit(ImageLoading());
    var imageUrl = await _repository.getSeriesCoverImage(seriesId);
    emit(ImageLoaded(imageUrl));
  }
}
