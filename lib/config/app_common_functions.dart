import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

 showSnackBar ({required BuildContext context, required String title}){
  return ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(title)));
}
void customLog(String message) {
 if (kDebugMode) {
  print(message);
 }
}