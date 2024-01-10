import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<int> {
  NavCubit() : super(0);

  void goToHome() => emit(0);
  void goToAddNote() => emit(1);
  void goToViewNote() => emit(2);
  void goToEditNote() => emit(3);
}
