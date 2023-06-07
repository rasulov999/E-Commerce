import 'package:flutter_bloc/flutter_bloc.dart';

class NavbarCubit extends Cubit<int> {
  NavbarCubit() : super(0);
  int activeIndex = 0;
  void nextPage(int newIndex) {
    emit(activeIndex = newIndex);
  }
}
