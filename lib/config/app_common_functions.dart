import 'package:flutter/material.dart';

 showSnackBar ({required BuildContext context, required String title}){
  return ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(title)));
}