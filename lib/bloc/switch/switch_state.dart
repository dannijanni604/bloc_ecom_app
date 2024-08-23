import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  bool isSwitch;
  double slider; 

  SwitchState({this.isSwitch = false, this.slider = 0.2});

  SwitchState copyWith({bool? isSwitch, double? slider}) {
    return SwitchState(
      
      isSwitch: isSwitch ?? this.isSwitch,
      slider: slider??this.slider,
      );
  }

  @override
  List<Object?> get props => [isSwitch,slider];
}
