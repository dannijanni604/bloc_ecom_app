import 'package:bloc_ecom_app/model/whitelist_items.dart';

class WhitelistRepository {
  Future<List<WhitelistItems>> fetchItems() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<WhitelistItems> _generateList(int length) {
    return List.generate(length, (index) => WhitelistItems(id: index.toString(), value: "Item $index"));
  }
}
