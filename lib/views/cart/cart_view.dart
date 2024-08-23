import 'package:bloc_ecom_app/bloc/cart/cart_bloc.dart';
import 'package:bloc_ecom_app/bloc/cart/cart_event.dart';
import 'package:bloc_ecom_app/bloc/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/consts.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return Center(child: Text('No Items in cart', style: kFont20));
          } else if (state.cartItems.isNotEmpty) {
            return ListView.builder(
                itemCount: state.cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(state.cartItems[index]),
                      trailing: IconButton(
                          onPressed: () {
                            context.read<CartBloc>().add(RemoveFromCartEvent(state.cartItems[index]));
                          },
                          icon: const Icon(Icons.delete)));
                });
          } else {
            return const SizedBox();
          }
        }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<CartBloc>().add(const AddToCartEvent('Item'));
            },
            child: const Icon(Icons.add)));
  }
}
