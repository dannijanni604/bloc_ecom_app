import 'dart:async';
import 'dart:convert';
import 'package:bloc_ecom_app/model/product.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    try {
      String productsUrl = 'https://jsonplaceholder.typicode.com/comments';
      final response = await http.get(Uri.parse(productsUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data.map((e) {
          return Product(
            postId: e['postId'] as int,
            name: e['name'] as String,
            email: e['email'] as String,
            body: e['body'] as String,
          );
        }).toList();
      }
    } on TimeoutException {
      throw Exception('Take much time to load data.');
    }
    throw Exception('Error while fetching data.');
  }
}
