import 'package:flutter/material.dart';

class ButtonCronometer extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? click;

  const ButtonCronometer({ Key? key, required this.icon, required this.text, this.click }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        textStyle: TextStyle(fontSize: 18)
      ),
      child: Row(
        children: [
          Icon(icon, size: 35,),
          SizedBox(width: 10,),
          Text(text)
        ],
      ),
      onPressed: click,
    );
  }
}