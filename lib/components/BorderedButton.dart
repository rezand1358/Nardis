import 'package:flutter/material.dart';


class BorderedButton extends StatelessWidget {

  String _title;
  double width;
  double height;
  final VoidCallback _onButtonClick;

  BorderedButton(this.width,this.height, this._title,this._onButtonClick);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    new GestureDetector(
        child:
    Container(
      width: this.width,
      height: this.height,
      margin: EdgeInsets.all(3.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: Colors.transparent,
        borderRadius: new BorderRadius.all(const Radius.circular(3.0)),
        border: Border.all(color: Colors.blueAccent,width: 0.5,style: BorderStyle.solid),
      ),
      child: new Text(
        this._title,
        style: new TextStyle(
          color: Colors.blueAccent,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),

    ),
      onTap: _onButtonClick,
    );
  }




}