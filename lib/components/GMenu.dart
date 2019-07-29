import 'package:flutter/material.dart';

class GMenu extends StatefulWidget {
  @override
  _GMenuState createState() => _GMenuState();
}
class _GMenuState extends State<GMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 15
            )
          ]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        child: Column(
          children: <Widget>[
            Hero(
              tag: '1',
              child: Icon(Icons.arrow_forward_ios,color: Colors.redAccent,size: 16.0,),
            ),
          ],
        ),
      ),
    );
  }
}