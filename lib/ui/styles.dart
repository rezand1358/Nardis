import 'package:flutter/material.dart';



class BorderedBox extends StatelessWidget {

  final Widget items;


  BorderedBox({ this.items});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        margin: EdgeInsets.all(3.0),
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
        decoration:const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5 , color: Color(0xFFFF000000)),
            left: BorderSide(width:  0.0, color: Color(0xFFFF000000)),
            right: BorderSide(width: 0.0, color: Color(0xFFFF000000)),
            bottom: BorderSide(width: 0.5, color: Color(0xFFFF000000)),
          ),
          color: Color(0xFFFFFFFFFF),
        ),
        child: this.items,
    );
  }

}