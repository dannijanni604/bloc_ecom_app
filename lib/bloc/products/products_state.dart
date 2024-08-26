import 'package:equatable/equatable.dart';

import '../../model/product.dart';
import '../../utils/enums.dart';

class ProductsState extends Equatable {
  final Status status;
  final List<Product> productsList;
  final String responseMessage;

  const ProductsState({
    this.status = Status.loading,
    this.productsList = const <Product>[],
    this.responseMessage = '',
  });

  ProductsState copyWith({
    Status? status,
    List<Product>? productsList,
    String? responseMessage,
  }) {
    return ProductsState(
      productsList: productsList ?? this.productsList,
      status: status ?? this.status,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }

  @override
  List<Object?> get props => [status, productsList];
}
