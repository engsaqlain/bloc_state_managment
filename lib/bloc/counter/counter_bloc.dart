import 'package:bloc/bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc  extends Bloc<CounterEvent,CounterState>{
  CounterBloc() : super(CounterState())
  {
   on<IncrementCounterEvent>(_incrementCounter);
   on<DecrementCounterEvent>(_decrementCounter);
  }
  void _incrementCounter(IncrementCounterEvent event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter+1));
  }
  void _decrementCounter(DecrementCounterEvent event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter-1));
  }
}