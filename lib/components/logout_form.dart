import 'package:flutter/material.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_brand_group.dart';
import 'package:nardis/data/soaps/soap_category.dart';
import 'package:nardis/data/soaps/soap_message.dart';
import 'package:nardis/data/soaps/special_offers.dart';
import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/customer.dart';
import 'package:nardis/models/user.dart';
import 'package:nardis/repository/user/user_repository.dart';
import 'package:nardis/translation_strings.dart';
import './InputFields.dart';

class LogoutForm extends StatefulWidget
{

  Customer user;
 LogoutForm({this.user});

  @override
  _LogoutFormState createState() {
    
    return _LogoutFormState();
  }
  
}

class _LogoutFormState extends State<LogoutForm> 
with TickerProviderStateMixin{

AnimationController formAnimationController;
Animation buttonAnimation;
Animation<Offset> pulseAnimation;
String message='';

  @override
  void initState() {
    
    super.initState();

    
    formAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );

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

  _logout()
  {
      
      UserRepository userRepo=new UserRepository();
      userRepo.deleteToken();//(username: widget.user.mobile,password: widget.user.password,code: widget.user.code);
      Navigator.pushReplacementNamed(context, '/login');
  }

_buildLogout() {
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
                         _logout();
                        },
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                        child: Text(Translations.of(context).confirm(), style: TextStyle(color: Colors.blueAccent)),
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
                            Navigator.pushReplacementNamed(context, '/home');
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

  
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
      double h=MediaQuery.of(context).size.height;
    return (
Container(
  color: Colors.white,
  height: h-50.0,
        child: /*Column(
          children: <Widget>[*/
        ListView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
            
Container(
              width: w,
              height: 175.0,
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
                    child: Icon(Icons.question_answer,
                      size: 25,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Spacer(),

                  Align(
                    alignment: Alignment.center,
                      child: Padding(
                      
                        padding: const EdgeInsets.only(
                          bottom: 5,
                          right: 5
                        ),
                        child: Text('خروج از حساب کاربری',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0
                          ),
                        ),
                      ),
                  ),
                   Spacer(),

                  Align(
                    alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 5,
                          right: 5
                        ),
                        child: Text('آیا با خروج از حساب کاربری خود مطمئن هستید؟',
                          style: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 16.0
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),
             SizedBox(
               height: 90.0,
            
             ),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  _buildLogout(),
                    _buildExit(),
                    ],
              ),
          ],
        ),
      )
    );
  }
  @override
  void dispose() {
    formAnimationController.dispose();
    super.dispose();
  }
}
