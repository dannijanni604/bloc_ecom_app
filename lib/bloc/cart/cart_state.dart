
import 'package:equatable/equatable.dart';

class CartState extends Equatable {

  final List<String> cartItems;

  const CartState({this.cartItems= const[]});

  CartState copyWith({List<String>? cartItems}){
     return CartState(cartItems: cartItems??this.cartItems);
}

  @override
  List<Object> get props =>[cartItems];

}

