part of 'image_cubit.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageLoaded extends ImageState {
  final String imageUrl;
  const ImageLoaded(this.imageUrl);

  @override
  List<Object> get props => [imageUrl];
}

class ImageError extends ImageState {}
