part of 'reader_cubit.dart';

abstract class ReaderState extends Equatable {
  const ReaderState();

  @override
  List<Object> get props => [];
}

class ReaderInitial extends ReaderState {}

class ReaderLoading extends ReaderState {}

class ReaderLoaded extends ReaderState {
  final Uint8List image;
  const ReaderLoaded(this.image);

  @override
  List<Object> get props => [image];
}
