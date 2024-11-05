import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    try {
      String productsUrl = 'https://jsonplaceholder.typicode.com/comments';
      final response = await http.get(Uri.parse(productsUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;

        return data.asMap().entries.map((entry) {
          final index = entry.key;
          final e = entry.value;
          return Product(
            id: e['id'] as int,
            postId: e['postId'] as int,
            name: e['name'] as String,
            email: e['email'] as String,
            body: e['body'] as String,
            image: 'https://picsum.photos/id/$index/200/300',
          );
        }).toList();
      }
    } on TimeoutException {
      throw Exception('Take much time to load data.');
    }
    throw Exception('Error while fetching data.');
  }
}
