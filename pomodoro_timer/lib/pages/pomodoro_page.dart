import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_timer/components/cronometer.dart';
import 'package:pomodoro_timer/components/enter_time.dart';
import 'package:pomodoro_timer/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Cronometer()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EnterTime(
                    title: 'Trabalho', 
                    value: store.workTime, 
                    inc: store.started && store.isWorking() ? null : store.incWorkTime, 
                    dec: store.started && store.isWorking() ? null : store.decWorkTime
                  ),
                  EnterTime(
                    title: 'Descanso', 
                    value: store.relaxTime, 
                    inc: store.started && store.isRelaxing() ? null : store.incRelaxTime, 
                    dec: store.started && store.isRelaxing() ? null : store.decRelaxTime,
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}