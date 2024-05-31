

import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context, String title, String content, VoidCallback onConfirm, {String confirmText = 'Confirm', String cancelText = 'Cancel'}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              if (onConfirm != null) {
                onConfirm(); // Execute the callback
              }
            },
            child: Text(confirmText),
          ),
        ],
      );
    },
  );
}

