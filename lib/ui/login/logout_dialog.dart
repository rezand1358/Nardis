import 'package:flutter/material.dart';
import 'package:nardis/components/form_validation.dart';
import 'package:nardis/components/logout_form.dart';
import 'package:nardis/models/customer.dart';
import 'package:nardis/models/user.dart';

import 'styles.dart';


class LogoutDialog extends StatefulWidget
{

  Customer user;

  LogoutDialog({this.user});
  @override
  _LogoutDialogState createState() {
    
    return  new _LogoutDialogState();
  }


}

class _LogoutDialogState extends State<LogoutDialog>
{




  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    
    return _confirmBody(context);
  }

  Widget _confirmBody(BuildContext context) {


    return new LogoutForm(user: widget.user);
  }


}