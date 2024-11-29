import 'package:flutter/material.dart';

class TextformfieldComponent extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? haveSuffixIcon;
  final bool isPassword;


  const TextformfieldComponent({
    super.key, required 
    this.label, 
    required this.controller, 
    required this.keyboardType, 
    this.haveSuffixIcon = false,
    this.isPassword     = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller    : controller,
      keyboardType  : keyboardType,
      obscureText   : isPassword ,
      decoration    : InputDecoration(  
        label      : Text(label),
        prefixIcon : const Icon(Icons.person, color: Colors.black),
        suffixIcon : (haveSuffixIcon == true) ? IconButton(
          icon      : const Icon(Icons.remove_red_eye_rounded),
          onPressed : () {} //TODO: HACER QUE SE VEA EL PASSWORD SI 
        ) : const SizedBox(),
        border        : OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        enabledBorder : const OutlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
        focusedBorder : OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
      ),
    );
  }
}