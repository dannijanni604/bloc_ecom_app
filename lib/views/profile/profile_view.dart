import 'dart:io';
import 'package:bloc_ecom_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_ecom_app/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_ecom_app/bloc/image_picker/image_picker_state.dart';
import 'package:bloc_ecom_app/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/switch/switch_bloc.dart';
import '../../bloc/switch/switch_event.dart';
import '../../utils/utils.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              Center(
                  child: Stack(children: [
                BlocBuilder<ImagePickerBloc, ImagePickerState>(
                    builder: (context, state) {
                  return state.file == null
                      ? const CircleAvatar(radius: 60)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(60.0),
                          child: Image.file(File(state.file!.path),
                              height: 120, width: 120, fit: BoxFit.cover));
                }),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: primaryColor)),
                        child: IconButton(
                            onPressed: () {
                              context
                                  .read<ImagePickerBloc>()
                                  .add(CameraCapture());
                            },
                            icon: const Icon(Icons.edit))))
              ])),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (previous, current) =>
                        previous.isSwitch != current.isSwitch,
                    builder: (context, state) {
                      return Switch(
                          value: state.isSwitch,
                          onChanged: (value) {
                            context
                                .read<SwitchBloc>()
                                .add(EnableOrDisableNotifications());
                          });
                    })
              ])
            ])));
  }
}
