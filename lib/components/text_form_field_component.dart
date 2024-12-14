import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/bloc/auth/auth_bloc.dart';

class TextformfieldComponent extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? haveSuffixIcon;
  final bool isPassword;
  final IconData? icon;
  final String? Function(String)? validatorFunction;
  final String? suffixText;

  const TextformfieldComponent({
    super.key, required 
    this.label, 
    required this.controller, 
    required this.keyboardType, 
    this.haveSuffixIcon = false,
    this.isPassword     = false,
    this.icon,
    this.validatorFunction, 
    this.suffixText,
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
      decoration   : InputDecoration(  
        suffixText : suffixText,
        label      : Text(label, style: const TextStyle(fontSize: 14.0, color: Colors.black54)),
        prefixIcon : (icon != null) ? Icon(icon, color: Colors.black) : null,
        suffixIcon : (haveSuffixIcon == true) ? IconButton(
          icon      : const Icon(Icons.remove_red_eye_rounded),
          onPressed : () {
            bool showpassword;
            isPassword == false  ? showpassword = true : showpassword = false;
            BlocProvider.of<AuthBloc>(context).showPassword(showPassword: showpassword);
          }
        ) : const SizedBox(),
        border        : OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        enabledBorder : const OutlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
        focusedBorder : OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
      ),
    );
  }
}