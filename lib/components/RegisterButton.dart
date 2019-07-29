import 'package:flutter/material.dart';


class SendRegister extends StatelessWidget {
  SendRegister();
  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: 320.0,
      height: 60.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: const Color(0xff0091ea),
        borderRadius: new BorderRadius.all(const Radius.circular(3.0)),
      ),
      child: new Text(
        'ارسال',
        style: new TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    ));
  }
}