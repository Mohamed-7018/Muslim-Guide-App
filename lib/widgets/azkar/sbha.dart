import 'package:flutter/material.dart';

class SbhaBtn extends StatelessWidget {
  final String text;
  final Function onClicked;

  const SbhaBtn({Key key, this.text, this.onClicked}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
      child: Text(
        text,
        style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      color: Colors.redAccent,
      onPressed: onClicked,
    );
  }
}
