part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class GetSeriesCoverImageEvent extends ImageEvent {
  final int seriesId;

  const GetSeriesCoverImageEvent(
    this.seriesId,
  );
}

class GetVolumeCoverImageEvent extends ImageEvent {
  final int volumeId;

  const GetVolumeCoverImageEvent(
    this.volumeId,
  );
}

class GetChapterCoverImageEvent extends ImageEvent {
  final int chapterId;

  const GetChapterCoverImageEvent(
    this.chapterId,
  );
}
