import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traning/bloc_counter_event.dart';
import 'package:traning/bloc_counter_state.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc():super(CounterInital(0)){
    // Event Handler
    on<IncrementEvent>(_onIncrement);
    on<DecrementEvent>(_onDecrement);
  }


  void _onIncrement(IncrementEvent event, Emitter<CounterState> emit) {
    final currentState = state;
    if(currentState is CounterInital){
      emit(CounterInital(currentState.count+1));
    }
  }
  void _onDecrement(DecrementEvent event, Emitter<CounterState> emit) {
    final currentState = state;
    if(currentState is CounterInital){
      emit(CounterInital(currentState.count-1));
    }
  }
}