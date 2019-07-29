import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nardis/translation_strings.dart';
import 'package:nardis/ui/login/confirm_form.dart';
import 'package:nardis/ui/login/confirm_login.dart';

class ConfirmLoginForm extends StatefulWidget
{
  @override
  ConfirmLoginFormState createState() {
    
    return ConfirmLoginFormState();
  }
  
}


class ConfirmLoginFormState extends State<ConfirmLoginForm>
{
  @override
  Widget build(BuildContext context) {
   
    return _showModalBottomSheet(context);
  }
  


  _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(context: context,
        builder: (BuildContext context) {
          return
            new Container(
              height: 350.0,
              color: Colors.transparent,
            child: new Container(
              decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
          topRight: const Radius.circular(10.0))),
            child:
            new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(leading: new Icon(Icons.close),
                  title: new Text(Translations.current.confirmrecievecode()),
                  onTap: () => null,
                ),
                new ConfirmLogin(),
                new DoConfirm()
              ],
            ),
            ),
            );

        });
  }
}