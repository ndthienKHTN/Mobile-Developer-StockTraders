import 'package:flutter/material.dart';

enum AlertType{info,error,warning}
class AlertDialogs {
   static void showAlert(BuildContext context, AlertType type, String message) {
    IconData icon;
    Color iconColor;

    switch (type) {
      case AlertType.error:
        icon = Icons.error;
        iconColor = Colors.red;
        break;
      case AlertType.warning:
        icon = Icons.warning;
        iconColor = Colors.orange;
        break;
      case AlertType.info:
        icon = Icons.info;
        iconColor = Colors.blue;
        break;
      default:
        icon = Icons.info;
        iconColor = Colors.blue;
        break;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(icon, color: iconColor),
          content:Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
