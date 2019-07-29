import 'package:flutter/material.dart';


class Button extends StatelessWidget {

  final String title;
  int color=0xff3949ab;
  Button({this.title,this.color});
  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: 320.0,
      height: 60.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: Color(this.color),
        borderRadius: new BorderRadius.all(const Radius.circular(3.0)),
      ),
      child: new Text(
        this.title,
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
