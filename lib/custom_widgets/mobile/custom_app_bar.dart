import 'package:bloc_ecom_app/utils/themes/light_theme.dart';
import 'package:flutter/material.dart';

Widget customAppBar({required String title}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 5,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded)),
        Container(
          decoration: BoxDecoration(
            color: primyColor,
            border: Border.all(
              color: secondaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 2,
          ),
          child: Text(
            title,
            style: const TextStyle(
                color: secondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.person_2_outlined))
      ],
    ),
  );
}
