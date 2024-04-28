import 'package:bloc_ecom_app/utils/themes/light_theme.dart';
import 'package:flutter/material.dart';

Widget customAppBar({required String title}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: primaryColor),
        child: Text(title,style: const TextStyle(color: lightThemeBg),)),
    leading: IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.person_2_outlined))
    ],
  );
}
