import 'package:flutter/material.dart';

class UpdateCounterButton extends StatelessWidget {
  const new({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });
  final String text;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(50, 50),
      ),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
