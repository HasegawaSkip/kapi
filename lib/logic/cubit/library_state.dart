part of 'library_cubit.dart';

abstract class LibraryState extends Equatable {
  const LibraryState();

  @override
  List<Object> get props => [];
}

class LibraryInitial extends LibraryState {}

class LibraryLoading extends LibraryState {}

class LibraryInfoLoaded extends LibraryState {
  final List<LibraryDto> libraryNames;

  const LibraryInfoLoaded(this.libraryNames);

  @override
  List<Object> get props => [libraryNames];
}
