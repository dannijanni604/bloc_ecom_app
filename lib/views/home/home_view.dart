import 'package:bloc_ecom_app/bloc/switch/switch_event.dart';
import 'package:bloc_ecom_app/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/custom_widgets/mobile/custom_app_bar.dart';
import '../../bloc/switch/switch_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print(' Build');
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(title: "ECOM", context: context),
          const Text('Slider'),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current)=>previous.slider!=current.slider,
              builder: (context, state) {
                 print("Slider Color Moving");
                return Container(
                  width: 250,
                  height: 100,
                  color: Colors.purple.withOpacity(state.slider));
              },
            ),
            SizedBox(
                width: 300,
                child: BlocBuilder<SwitchBloc, SwitchState>(

                   buildWhen: (previous, current)=>previous.slider!=current.slider,
                    builder: (context, state) {
                       print("Slider Moving");
                  return Slider(
                      value: state.slider,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(SliderEvent(slider: value));
                      });
                },
                 ))
          ],
        ),
      )),
    );
  }
}
