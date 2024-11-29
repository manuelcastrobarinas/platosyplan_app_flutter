import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final double minWidth;
  final double minHeight;
  final void Function() function;
  final String text;
  
  const ButtonComponent({
    super.key, 
    required this.minWidth, 
    required this.minHeight, 
    required this.function, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth  : minWidth,
      elevation : 0,
      height: minHeight,
      color : Theme.of(context).primaryColor,
      shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: function,
      child : Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis, fontSize: 17), maxLines: 1),
    );
  }
}