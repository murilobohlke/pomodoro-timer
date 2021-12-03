import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_timer/components/button_cronometer.dart';
import 'package:pomodoro_timer/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Cronometer extends StatelessWidget {
  const Cronometer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    
    return Observer(
      builder: (context) => Container(
        color:store.isWorking() ? Colors.red : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              store.isWorking() ? 'Hora de Trabalhar' : 'Hora de Descansar', 
              style: TextStyle(fontSize: 40, color: Colors.white)
            ),
            SizedBox(height: 20,),
            Text('${store.minutes.toString().padLeft(2,'0')}:${store.seconds.toString().padLeft(2,'0')}', style: TextStyle(fontSize: 120, color: Colors.white)),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(!store.started)
                ButtonCronometer(icon: Icons.play_arrow, text: 'Iniciar', click: store.start,),
                if(store.started)
                ButtonCronometer(icon: Icons.stop, text: 'Parar', click: store.stop,),
                ButtonCronometer(icon: Icons.refresh, text: 'Reiniciar', click: store.restart,),
              ],
            )
          ],
        ),
      ), 
    );
  }
}