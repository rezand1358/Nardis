import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {

 _onLoading(BuildContext context) {
 return showDialog(
    context: context,
    barrierDismissible: false,
    child: new Dialog(
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          new CircularProgressIndicator(),
        ],
      ),
    ),
  );
  
}

  @override
  Widget build(BuildContext context) {
  return new Center(
        child: 
          new CircularProgressIndicator(),
      );
      
  }
}