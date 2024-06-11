import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textcolor;
  final String buttonText;
  final buttontapped;
  const MyButton(
      {super.key,
      this.color,
      this.textcolor,
      required this.buttonText,
      this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: textcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
