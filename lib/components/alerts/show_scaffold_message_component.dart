
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showScaffoldMessageComponent({required BuildContext context, required String message}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Theme.of(context).secondaryHeaderColor));  
}