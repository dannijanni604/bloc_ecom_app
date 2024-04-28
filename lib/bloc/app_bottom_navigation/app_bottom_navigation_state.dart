part of 'app_bottom_navigation_bloc.dart';

@immutable
sealed class AppBottomNavigationState {
  final int initialIndex;

  const AppBottomNavigationState({required this.initialIndex});
}

final class AppBottomNavigationInitial extends AppBottomNavigationState {
  const AppBottomNavigationInitial({required super.initialIndex});
}
