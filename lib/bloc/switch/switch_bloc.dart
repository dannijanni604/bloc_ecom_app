import 'package:bloc/bloc.dart';

import 'switch_event.dart';
import 'switch_state.dart';


class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
SwitchBloc():super(SwitchState()){
  on<EnableOrDisableNotifications>(_enableOrDisableNotifications);
  on<SliderEvent>(_slider);
}

void _enableOrDisableNotifications(
 EnableOrDisableNotifications events, Emitter<SwitchState> emit
){
  emit(state.copyWith(isSwitch: !state.isSwitch));
}



void _slider(
 SliderEvent events, Emitter<SwitchState> emit
){
  emit(state.copyWith(slider: events.slider));
}

}
