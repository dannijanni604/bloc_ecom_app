import 'package:bloc/bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';


class CartBloc extends Bloc<CartEvent, CartState> {

  final List<String> cartItems=[];
  CartBloc() : super(const CartState()) {
on<AddToCartEvent>(_addToCart);
on<RemoveFromCartEvent>(_removeFromCart);
  }

  void _addToCart(AddToCartEvent event, Emitter<CartState> emit){
    cartItems.add(event.item);
    emit(state.copyWith(cartItems: List.from(cartItems)));
  }

  void _removeFromCart(RemoveFromCartEvent event, Emitter<CartState> emit){
    cartItems.remove(event.index);
    emit(state.copyWith(cartItems: List.from(cartItems)));
  }
}
