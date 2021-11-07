import 'package:flutter/material.dart';

class PostBtn extends StatefulWidget {


   int n;

   PostBtn({
    Key key,
    this.n,
  }) : super(key: key);

  @override
  _PostBtnState createState() => _PostBtnState();
}

class _PostBtnState extends State<PostBtn> {
  onClick () {
    if (widget.n>0)
    setState(() {
      widget.n = widget.n -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.pink[700], width: 2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          backgroundColor: Colors.white.withOpacity(0.2),
        ),
        child: widget.n == 0 ? Container(
          height: 30,
          child: Image.asset(
            "assets/azkar/correct.gif",
            fit: BoxFit.cover,
          ),
        ): Text (
              "Remaining times: ${widget.n}"
            ),
        onPressed: onClick,
      ),
    );
  }
}
