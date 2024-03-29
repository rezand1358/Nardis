
import 'package:flutter/material.dart';
import 'package:nardis/translation_strings.dart';



class DoConfirm extends StatelessWidget  {
  DoConfirm();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      width: 320.0,
      height: 60.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: Colors.transparent,
        border: new Border.all(color: Color(0xffff4081),width: 1.0,),
        borderRadius: new BorderRadius.all(const Radius.circular(2.0)),
      ),
      child: new Text(
        Translations.of(context).confirm(),
        style: new TextStyle(
          color: Colors.pink,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
  }




}