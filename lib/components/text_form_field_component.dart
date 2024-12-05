import 'package:flutter/material.dart';

class TextformfieldComponent extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? haveSuffixIcon;
  final bool isPassword;
  final IconData icon;
  final String? Function(String)? validatorFunction;


  const TextformfieldComponent({
    super.key, required 
    this.label, 
    required this.controller, 
    required this.keyboardType, 
    this.haveSuffixIcon = false,
    this.isPassword     = false,
    required this.icon,
    this.validatorFunction, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller    : controller,
      keyboardType  : keyboardType,
      obscureText   : isPassword,
      validator     : (value) {
          if (value!.isEmpty) return 'Este campo es obligatorio';
          if (validatorFunction != null) return validatorFunction!(value); 
          return null;
      },
      decoration    : InputDecoration(  
        label      : Text(label),
        prefixIcon :  Icon(icon, color: Colors.black),
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