import 'package:flutter/material.dart';
import 'package:nardis/components/BorderedButton.dart';
import 'package:nardis/translation_strings.dart';


class SendRequest extends StatelessWidget {

  double w,h;
  SendRequest(this.w,this.h);

  _sendRequest()
  {

  }
  @override
  Widget build(BuildContext context) {
    return (new BorderedButton(w,h,Translations.current.send(),_sendRequest) /*Container(
      width: 320.0,
      height: 60.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: const Color(0x883949ab),
        borderRadius: new BorderRadius.all(const Radius.circular(3.0)),
      ),
      child: new Text(
        Translations.of(context).login(),
        style: new TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    )*/);
  }

}