import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final double minWidth;
  final double minHeight;
  final void Function()? function;
  final String text;
  final double? borderRadius;
  final Color? backgroundColor;
  final bool isLoading;

  const ButtonComponent({
    super.key, 
    required this.minWidth, 
    required this.minHeight, 
    required this.function, 
    required this.text,
    this.borderRadius,
    this.backgroundColor,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth  : minWidth,
      elevation : 0,
      height: minHeight,
      disabledColor:  Colors.grey[400],
      color : backgroundColor ?? Theme.of(context).primaryColor,
      shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 10)),
      onPressed:isLoading ? null : function,
      child : isLoading 
        ? const Center(
          child: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(color: Colors.white),
        )) 
        : Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis, fontSize: 17), maxLines: 1),
    );
  }
}