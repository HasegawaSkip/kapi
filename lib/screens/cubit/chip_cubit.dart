import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// part 'chip_state.dart';

class ChipCubit extends Cubit<int> {
  ChipCubit() : super(0);

  // void onBuild(int index) {
  //   // print(index);
  //   emit(index);
  // }

  void onSelected(int index) {
    // print(index);
    emit(index);
  }
}
