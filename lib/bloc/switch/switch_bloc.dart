import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/bloc/switch/switch_event.dart';
import 'package:bloc_state_managment/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableAndDisableSwitch>(_enableAndDisableSwitch);
    on<SliderEvent>(_slider);
  }

  void _enableAndDisableSwitch(
    EnableAndDisableSwitch event,
    Emitter<SwitchState> emit,
  ) {
    emit(state.copyWith(isSwitched: !state.isSwitched));
  }

  void _slider(
    SliderEvent event,
    Emitter<SwitchState> emit,
  ) {
    emit(state.copyWith(sliderValue: event.slider));
  }
}
