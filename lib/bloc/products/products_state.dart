import 'package:equatable/equatable.dart';

import '../../model/product.dart';
import '../../utils/enums.dart';

class ProductsState extends Equatable {
  final Status status;
  final List<Product> productsList;
  final List<Product> temProductsList;
  final String responseMessage;
  final String searchMessage;

  const ProductsState({
    this.status = Status.loading,
    this.productsList = const <Product>[],
    this.temProductsList = const <Product>[],
    this.responseMessage = '',
    this.searchMessage = '',
  });

  ProductsState copyWith({
    Status? status,
    List<Product>? productsList,
    List<Product>? temProductsList,
    String? responseMessage,
    String? searchMessage,
  }) {
    return ProductsState(
      productsList: productsList ?? this.productsList,
      temProductsList: temProductsList ?? this.temProductsList,
      status: status ?? this.status,
      responseMessage: responseMessage ?? this.responseMessage,
      searchMessage: searchMessage ?? this.searchMessage,

    );
  }

  @override
  List<Object?> get props => [status, productsList,temProductsList,responseMessage,searchMessage];
}
