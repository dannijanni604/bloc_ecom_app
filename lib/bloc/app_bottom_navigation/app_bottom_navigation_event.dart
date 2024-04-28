part of 'app_bottom_navigation_bloc.dart';

@immutable
sealed class AppBottomNavigationEvent {}

class OnTapChage extends AppBottomNavigationEvent {
  final int tapIndex;

  OnTapChage({required this.tapIndex});
}
