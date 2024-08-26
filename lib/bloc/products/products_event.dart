import 'package:equatable/equatable.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class FetchProducts extends ProductsEvent {}

class SearchProducts extends ProductsEvent {
  final String searchString;

  const SearchProducts(this.searchString);
}
