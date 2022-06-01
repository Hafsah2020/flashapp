import 'package:flutter/material.dart';

class ClickButton extends StatefulWidget {
  ClickButton({
    required this.color,
    required this.function,
    required this.text,
  });
  Color color;
  Function() function;
  String text;
  @override
  _ClickButtonState createState() => _ClickButtonState();
}

class _ClickButtonState extends State<ClickButton> {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: widget.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: widget.function,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            widget.text,
          ),
        ),
      ),
    );
  }
}
