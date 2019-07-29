import 'package:flutter/material.dart';
import 'package:nardis/components/form_validation.dart';
import 'package:nardis/models/customer.dart';
import 'package:nardis/models/user.dart';

import 'styles.dart';


class ConfirmLogin extends StatefulWidget
{

  Customer user;

  ConfirmLogin({this.user});
  @override
  _ConfirmLoginState createState() {
    
    return  new _ConfirmLoginState();
  }


}

class _ConfirmLoginState extends State<ConfirmLogin>
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


    return new FormValidation(user: widget.user);
  }


}