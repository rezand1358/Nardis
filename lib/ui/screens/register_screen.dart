import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nardis/bloc/register/register.dart';
import 'package:nardis/components/RegisterButton.dart';
import 'package:nardis/components/RegisterForm.dart';


class RegisterScreen extends StatefulWidget
{
  @override
  _RegisterState createState() {
    
    return _RegisterState();
  }

}

class _RegisterState extends State<RegisterScreen>
{

  ValueChanged<String> onChanged;
 




  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.arrow_forward_ios, color: Colors.white,),
              onPressed: () {
                  Navigator.pushReplacementNamed(context,'/login');
              }
          ),
        ],
    
      ),
      body:
        BlocProvider<RegisterBloc>(
          builder: (context) => RegisterBloc(),
        child:
          new Container(
      //height: MediaQuery.of(context).size.height-20,
      child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
      new RegisterContainer(),
            //new SendRegister()
      ]
      )
    ),
        ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  
  

}