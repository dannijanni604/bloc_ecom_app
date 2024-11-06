import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../views/views.dart';

AppBar customAppBar({required String title, required BuildContext context}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: primaryColor),
        child: Text(title, style: const TextStyle(color: lightThemeBg))),
    leading: IconButton(
        onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
    actions: [
      IconButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartView())),
          icon: const Icon(Icons.shopping_cart_outlined)),
      IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileView()));
          },
          icon: const Icon(Icons.person_2_outlined))
    ],
  );
}

AppBar authAppBar() {
  return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: true,
      title: const Text('ECOM', style: TextStyle(color: lightThemeBg)));
}
