import 'package:bloc/bloc.dart';
import '../../model/model.dart';
import '../../repository/repository.dart';
import 'whitelist_event.dart';
import 'whitelist_state.dart';

class WhitelistBloc extends Bloc<WhitelistEvent, WhitelistState> {
  WhitelistRepository whitelistRepository;

  List<WhitelistItems> whiteListItems = [];

  WhitelistBloc(this.whitelistRepository) : super(const WhitelistState()) {
    on<FetchWhiteList>(fetchList);
    on<FavouriteItem>(_addFavouriteItem);
  }

  void fetchList(FetchWhiteList event, Emitter<WhitelistState> emit) async {
    whiteListItems = await whitelistRepository.fetchItems();
    emit(state.copyWith(whiteListItems: List.from(whiteListItems), listStatus: ListStatus.success));
  }

  void _addFavouriteItem(FavouriteItem event, Emitter<WhitelistState> emit) async {
    final index = whiteListItems.indexWhere(
      (element) => element.id == event.item.id,
    );

    whiteListItems[index] = event.item;
    emit(state.copyWith(whiteListItems: List.from(whiteListItems)));
  }
}
