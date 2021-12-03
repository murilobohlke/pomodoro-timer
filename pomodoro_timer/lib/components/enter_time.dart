import 'package:flutter/material.dart';
import 'package:pomodoro_timer/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class EnterTime extends StatelessWidget {
  final int value;
  final String title;
  final void Function()? inc;
  final void Function()? dec;

  const EnterTime({required this.title, required this.value, this.inc, this.dec});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(this.title, style: TextStyle(fontSize: 25)),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: dec, 
              child: Icon(Icons.arrow_downward),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                primary: store.isWorking() ? Colors.red : Colors.green,
              ),
            ),
            Text('${this.value} min', style: TextStyle(fontSize: 18),),
            ElevatedButton(
              onPressed: inc, 
              child: Icon(Icons.arrow_upward),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                primary: store.isWorking() ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}