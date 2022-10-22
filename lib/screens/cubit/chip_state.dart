part of 'chip_cubit.dart';

abstract class ChipState extends Equatable {
  const ChipState();

  @override
  List<Object> get props => [];
}

class ChipInitial extends ChipState {}

class ChipSelected extends ChipState {
  int index;

  ChipSelected(
    this.index,
  );

  @override
  List<Object> get props => [index];
}
