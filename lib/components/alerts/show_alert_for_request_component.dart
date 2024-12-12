import 'package:flutter/material.dart';

class ShowAlertForRequestComponent extends StatelessWidget {

  final String title;
  final String informationAlert;
  final String? cancelText;
  final Widget buttonAccept;

  const ShowAlertForRequestComponent({
    super.key, 
    required this.title, 
    required this.informationAlert, 
    this.cancelText,
    required this.buttonAccept,
  });

  @override
  Widget build(BuildContext context) {
    return _AlertToRequest(
      buttonAccept: buttonAccept, 
      title: title, 
      informationAlert: informationAlert,
      cancelText: cancelText,
    );
  }
}

class _AlertToRequest extends StatelessWidget {

  final String title;
  final String informationAlert;
  final Widget buttonAccept;
  final String? cancelText;
 
  const _AlertToRequest({
    required this.title, 
    required this.informationAlert, 
    required this.buttonAccept,
    required this.cancelText
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title   : Text( title, style: const TextStyle( fontWeight: FontWeight.w800 ) ),
      content : Text( informationAlert, maxLines: 20, overflow: TextOverflow.ellipsis ),
      actionsAlignment : MainAxisAlignment.spaceBetween,
      elevation : 10.0,
      shape : RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) ),
      actions : <Widget> [  
        MaterialButton(
          textColor : Colors.blue,
          onPressed : () {
            Navigator.pop(context);
            return ;
          },
          child: Text(cancelText ?? 'No'),
        ),
        buttonAccept
      ],
    );
  }
}