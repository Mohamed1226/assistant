import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {

  final Function onPressed;
  final String txt;
final Color color;
  CustomElevatedButton(this.onPressed, this.txt,[this.color]);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(

        style: ElevatedButton.styleFrom(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 50),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Text(
            txt,
            style: TextStyle(
                fontSize: 30,
                color: color==null? Colors.deepPurple: color,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
