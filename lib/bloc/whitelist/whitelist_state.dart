import 'package:equatable/equatable.dart';
import '../../model/whitelist_items.dart';

enum ListStatus { loading, success, failed }

class WhitelistState extends Equatable {
  final List<WhitelistItems> whiteListItems;
  final ListStatus listStatus;

  const WhitelistState({this.whiteListItems = const [], this.listStatus = ListStatus.loading});

  WhitelistState copyWith({List<WhitelistItems>? whiteListItems, ListStatus? listStatus}) {
    return WhitelistState(
      whiteListItems: whiteListItems ?? this.whiteListItems,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [whiteListItems,listStatus ];
}
