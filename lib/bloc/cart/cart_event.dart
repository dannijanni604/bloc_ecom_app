import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
const CartEvent();
}

class AddToCartEvent extends CartEvent{
  final String item;
  const AddToCartEvent(this.item);

  @override
  List<Object?> get props =>[item];
}

class RemoveFromCartEvent extends CartEvent{

  final Object index;
  const RemoveFromCartEvent(this.index);

  @override
  List<Object?> get props =>[index];
}


