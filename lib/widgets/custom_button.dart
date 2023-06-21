import 'package:flutter/material.dart';
import 'package:zoomapp/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: buttonColor)),
        ),
      ),
    );
  }
}
