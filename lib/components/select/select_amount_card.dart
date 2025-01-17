import 'package:flutter/material.dart';

 class SelectAmountCardComponent extends StatelessWidget {

    final int stateIntValue;
    final int value;
    final void Function()? function;
    
    const SelectAmountCardComponent({
      super.key, 
      required this.value, 
      required this.stateIntValue,
      required this.function
    });
  
    @override
    Widget build(BuildContext context) {
      return InkWell(
        onTap : function,
        child : Container(
          width   : 110,
          margin  : const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0), // Separación entre las tarjetas
          padding : const EdgeInsets.symmetric(vertical: 14.0),
          decoration: BoxDecoration(
            color : (value == stateIntValue) ? Theme.of(context).primaryColor : Colors.white,
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child : Text(
            value.toString(),
            style: TextStyle(
              fontSize  : 18,
              fontWeight: FontWeight.bold,
              color: (value == stateIntValue) ? Colors.white : Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }