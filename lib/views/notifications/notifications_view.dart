import 'package:bloc_ecom_app/bloc/switch/switch_bloc.dart';
import 'package:bloc_ecom_app/bloc/switch/switch_event.dart';
import 'package:bloc_ecom_app/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Notification'),actions: [
        ])
    );
  }
}
