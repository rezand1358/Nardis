import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nardis/authentication/authentication.dart';
import 'package:nardis/bloc/login/login.dart';
import 'package:nardis/constants/constants.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_customer.dart';
import 'package:nardis/translation_strings.dart';


class LoginForm extends StatefulWidget
{

  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;
  
  LoginForm({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);
  
  @override
  _LoginFormState createState() {
  
    return _LoginFormState();
  }
  
}

class _LoginFormState extends State<LoginForm>
      with TickerProviderStateMixin
{

  LoginBloc get _loginBloc => widget.loginBloc;
  AnimationController formAnimationController;
  List<Animation> formAnimations;
  Animation buttonAnimation;
  Animation<Offset> pulseAnimation;

  int index=1;
  String mobile='';

  @override
  void initState() {
    
    super.initState();
    formAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );

double start = index * 0.1;
double duration = 0.6;
double end = duration + start;
formAnimations=[new Tween<double>(begin: 800.0, end: 0.0).animate(
          new CurvedAnimation(
              parent: formAnimationController,
              curve: new Interval(start, end, curve: Curves.decelerate))),
              new Tween<double>(begin: 800.0, end: 0.0).animate(
          new CurvedAnimation(
              parent: formAnimationController,
              curve: new Interval(start*2, end, curve: Curves.decelerate)))];
    buttonAnimation = new CurvedAnimation(
        parent: formAnimationController,
        curve: Interval(0.7, 1.0, curve: Curves.decelerate));


        pulseAnimation = Tween<Offset>(
          begin: Offset(6, 0),
          end: Offset.zero,
        ).animate(
                    CurvedAnimation(
                      parent: formAnimationController,
                      curve: Interval(
                        0.0,
                        0.6,
                        curve: Curves.ease,
                      ),
                    ),
);
    formAnimationController.forward();
    
  }

 @override
  void dispose() {
    formAnimationController.dispose();
    super.dispose();
  }

_buildLogin() {
    return SlideTransition(
      position: pulseAnimation,
      child: 
        Container(
                    margin: EdgeInsets.only(bottom: 2.0,left: 5.0,right: 5.0),
                    height: 48,
                    width: MediaQuery.of(context).size.width/2.5,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent[100],style: BorderStyle.solid,width: 0.5),
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.transparent
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(3.0)
                      )
                    ),
                    child: 
                    Center(
                      child:
                      RaisedButton(
                        onPressed: (){
                         new SoapCustomer(context: context).call(SoapConstants.METHOD_NAME_CUSTOMER_LOGIN, 'MobileNo', mobile);
                        },
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                        child: Text(Translations.of(context).login(), style: TextStyle(color: Colors.blueAccent)),
                        color: Colors.transparent,
                      ),
                    ),
            )



      
      
    );
  }

_buildExit() {
    return SlideTransition(
      position: pulseAnimation,
      child: 
        Container(
                      margin: EdgeInsets.only(bottom: 2.0,left: 5.0,right: 5.0),
                      height: 48,
                      width:MediaQuery.of(context).size.width/2.5,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.pinkAccent[100],style: BorderStyle.solid,width: 0.5),
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.transparent
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(3.0)
                          )
                      ),
                      child: Center(
                        child:
                        RaisedButton(
                          onPressed: (){
                            SystemNavigator.pop();
                          },
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                          child: Text(Translations.of(context).exit(), style: TextStyle(color: Colors.blueAccent)),
                          color: Colors.transparent,
                        ),
                      ),
                    ),



      
      
    );
  }

  _buildUsername(){
    return  SlideTransition(
      position: pulseAnimation,
      child:  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent[100],style: BorderStyle.solid,width: 0.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 0.0
                        )
                      ]
                    ),
                    child: 
                     TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 4.0,bottom: 0.0,),
                        border: InputBorder.none,
                        icon: Icon(Icons.person_pin,
                            color: Colors.blueAccent[100],
                        ),
                        hintStyle: TextStyle(color: Colors.pinkAccent[100]),
                          hintText: Translations.of(context).userName(),
                      ),
                      onChanged: (value){
                        this.mobile=value;
                      },
                    ),
                    
                 
                  ),
    );
  }

 _buildPassword(){
    return  SlideTransition(
      position: pulseAnimation,
      child:  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent[100],style: BorderStyle.solid,width: 0.5),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.transparent,
                              blurRadius: 0.0
                          )
                        ]
                    ),
                    child: 
                    TextField(

                      textAlign: TextAlign.start ,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 4.0,bottom: 0.0,),
                        border: InputBorder.none,
                        icon: Icon(Icons.vpn_key,
                          color: Colors.blueAccent[100],
                        ),
                        hintStyle: TextStyle(color: Colors.pinkAccent[100]),
                        hintText: Translations.of(context).password(),
                      ),
                    ),
                    
                  ),
    );
  }


  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
      double h=MediaQuery.of(context).size.height;

    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (
        BuildContext context,
        LoginState state,
      ) {
        return
      Container(
        child: /*Column(
          children: <Widget>[*/
        ListView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
            Container(
              width: w,
              height: h/3.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade900,
                    Colors.blueAccent
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90)
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [

                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.person,
                      size: 90,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Spacer(),

                  Align(
                    alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 32,
                          right: 32
                        ),
                        child: Text(Translations.of(context).login(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),

            Container(
              height: h/3.2,
              width: w,
              padding: EdgeInsets.only(top: 32),
              child:
            Column(

              /*height: MediaQuery.of(context).size.height/3.2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 32),*/
              children: <Widget> [

                    _buildUsername(),
                    //_buildPassword(),
                  ]
            ),
            ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  // GestureDetector(
                  //   onTap: () {

                  //   },
                  //   child:
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(
                  //       top: 10, right: 2,bottom: 20.0,left: 2.0
                  //     ),
                  //     child: Text(Translations.of(context).forgotPassword(),
                  //       style: TextStyle(
                  //         color: Colors.pinkAccent
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // ),
              GestureDetector(
                child:
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, right: 2,bottom: 20.0,left: 2.0
                  ),
                  child: Text(Translations.of(context).register(),
                    style: TextStyle(
                        color: Colors.greenAccent
                    ),
                  ),
                ),
              ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
              ),
    ],
                  ),
                 // ],
        //),
                  //Spacer(),

              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  _buildLogin(),
                    _buildExit(),
                    ],
              ),
          ],
        ),
      );
      });
  }
  
}