import 'package:bloc_ecom_app/model/whitelist_items.dart';
import 'package:equatable/equatable.dart';

abstract class WhitelistEvent extends Equatable {
  @override
 List<Object?> get props =>[];
}

class FetchWhiteList extends WhitelistEvent{}
class FavouriteItem extends WhitelistEvent{
  final WhitelistItems item;
  FavouriteItem({required this.item});
}