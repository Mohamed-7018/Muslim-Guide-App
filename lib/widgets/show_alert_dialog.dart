import 'package:flutter/cupertino.dart';

Future<bool> showAlertDialogue(
    BuildContext context, {
      @required String title,
      @required String content,
      @required String defaultactiontext,
      String cancelactiontext,
    }) {
  return showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (cancelactiontext != null)
            CupertinoDialogAction(
              child: Text(cancelactiontext),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          CupertinoDialogAction(
            child: Text(defaultactiontext),
            onPressed: () => Navigator.of(context).pop(true),
          )
        ],
      ));
}
