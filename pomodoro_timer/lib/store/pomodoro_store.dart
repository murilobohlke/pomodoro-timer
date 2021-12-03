import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

enum IntervalType {WORK, RELAX} 

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  @observable
  bool started = false;

  @observable
  int minutes = 2;

  @observable
  int seconds = 0;
  
  @observable
  int workTime = 2;

  @observable 
  int relaxTime = 1;

  @observable
  IntervalType intervalType = IntervalType.WORK;

  Timer? cronometer;

  @action 
  void incWorkTime () {
    workTime++;
    if(isWorking()){
      restart();
    }
  }

  @action 
  void decWorkTime () {
    if(workTime > 1){
      workTime--;
      if(isWorking()){
        restart();
      }
    }
  }

  @action 
  void incRelaxTime () {
    relaxTime++;
    if(isRelaxing()){
      restart();
    }
  }

  @action 
  void decRelaxTime () {
    if(relaxTime > 1){
      relaxTime--;
      if(isRelaxing()){
        restart();
      }
    }
  }

  @action 
  void start() {
    started = true;
    cronometer = Timer.periodic(Duration(seconds: 1), (timer) { 
      if(minutes==0 && seconds==0){
        _changeIntervalType();
      } else if(seconds==0){
        seconds = 59;
        minutes--;
      } else{
        seconds--;
      }
    });
  }

  @action 
  void stop() {
    started = false;
    cronometer?.cancel();
  }

  @action 
  void restart() {
    stop();
    minutes = isWorking() ? workTime : relaxTime;
    seconds = 0;
  }

  bool isWorking() {
    return intervalType == IntervalType.WORK;
  }
  
  bool isRelaxing() {
    return intervalType == IntervalType.RELAX;
  }

  void _changeIntervalType() {
    if(isWorking()){
      intervalType = IntervalType.RELAX;
      minutes = relaxTime;
    } else{
      intervalType = IntervalType.WORK;
      minutes = workTime;
    }
    seconds = 0;
  }

}