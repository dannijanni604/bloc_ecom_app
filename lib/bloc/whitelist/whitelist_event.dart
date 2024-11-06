import 'package:equatable/equatable.dart';
import '../../model/model.dart';

abstract class WhitelistEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchWhiteList extends WhitelistEvent {}

class FavouriteItem extends WhitelistEvent {
  final WhitelistItems item;
  FavouriteItem({required this.item});
}
