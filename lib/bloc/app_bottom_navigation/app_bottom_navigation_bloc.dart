import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_bottom_navigation_event.dart';
part 'app_bottom_navigation_state.dart';

class AppBottomNavigationBloc
    extends Bloc<AppBottomNavigationEvent, AppBottomNavigationState> {
  AppBottomNavigationBloc()
      : super(const AppBottomNavigationInitial(initialIndex: 0)) {
    on<AppBottomNavigationEvent>((event, emit) {
      if (event is OnTapChage) {
        emit(AppBottomNavigationInitial(initialIndex: event.tapIndex));
      }
    });
  }
}
