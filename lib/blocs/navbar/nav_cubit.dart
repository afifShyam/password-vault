import 'package:flutter_bloc/flutter_bloc.dart';

import 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(const NavState());

  void setIndex(int index) => emit(state.copyWith(index: index));

  void setShowNavBar(bool value) => emit(state.copyWith(showNavBar: value));
}
