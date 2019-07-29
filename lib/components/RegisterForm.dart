import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nardis/bloc/register/register.dart';
import 'package:nardis/bloc/register/register_bloc.dart';
import 'package:nardis/components/confirm_login_form.dart';
import 'package:nardis/components/input_text.dart';
import 'package:nardis/components/loading_indicator.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_save_customer.dart';
import 'package:nardis/models/customer.dart';
import 'package:nardis/models/viewmodels/api_customer.dart';
import 'package:nardis/translation_strings.dart';
import 'package:nardis/ui/login/confirm_login.dart';
//import 'package:healthy_style/translation_strings.dart';
import './InputFields.dart';


class RegisterContainer extends StatefulWidget
{


   ValueChanged<String> onChanged;


   RegisterContainer();

  @override
  _RegisterContainerState createState() {
    return _RegisterContainerState();
  }


}
class _RegisterContainerState extends State<RegisterContainer> with TickerProviderStateMixin {

  AnimationController formAnimationController;
  List<Animation> formAnimations;
  Animation buttonAnimation;
  Animation<Offset> pulseAnimation;

  int index=1;
  Customer user;

  _lastNameChanged(value)
  {
    user.lastName=value;
  }

  _mobileChanged(value)
  {
    user.mobile=value;
  }
  _firstNameChanged(value)
  {
    user.firstName=value;
  }
  _addressChanged(value)
  {
    user.address=value;
  }
  _buildLastName(){
    return  SlideTransition(
      position: pulseAnimation,
      child:  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
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
                      InputText(
                        icon: Icon(Icons.person_pin,
                            color: Colors.blueAccent[100],
                        ),
                        hintText:Translations.of(context).lastName() ,
                        labelText: Translations.of(context).lastName(),
                        errorText: 'نام خانوادگی الزامی است',
                        onChangedValue: (value) => _lastNameChanged(value),

                      )

                    //  TextField(
                       
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.only(top: 4.0,bottom: 0.0,),
                    //     border: InputBorder.none,
                    //     icon: Icon(Icons.person_pin,
                    //         color: Colors.blueAccent[100],
                    //     ),
                    //     hintStyle: TextStyle(color: Colors.pinkAccent[100]),
                    //       hintText: Translations.of(context).lastName(),
                           
                    //   ),
                      
                    //   onChanged: (value){
                    //     user.lastName=value;
                    //   },
                    // ),
                    
                 
                  ),
    );
  }

  _buildMobile(){
    return  SlideTransition(
      position: pulseAnimation,
      child:  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
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
                     InputText(
                        icon: Icon(Icons.person_pin,
                             color: Colors.blueAccent[100],
                         ),
                        hintText:Translations.of(context).mobile() ,
                        labelText: Translations.of(context).mobile(),
                        errorText: 'موبایل الزامی است',
                        onChangedValue: (value) => _mobileChanged(value),

                      )
                    //  TextField(
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.only(top: 4.0,bottom: 0.0,),
                    //     border: InputBorder.none,
                    //     icon: Icon(Icons.person_pin,
                    //         color: Colors.blueAccent[100],
                    //     ),
                    //     hintStyle: TextStyle(color: Colors.pinkAccent[100]),
                    //       hintText: Translations.of(context).mobile(),
                    //   ),
                    //   onChanged: (value){
                    //     user.mobile=value;
                    //   },
                    // ),
                    
                 
                  ),
    );
  }

  _buildEmail(){
    return  SlideTransition(
      position: pulseAnimation,
      child:  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
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
                          hintText: Translations.of(context).email(),
                      ),
                      onChanged: (value){
                        user.email=value;
                      },
                    ),
                    
                 
                  ),
    );
  }

_buildPostalCode(){
    return  SlideTransition(
      position: pulseAnimation,
      child:  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
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
                          hintText: Translations.of(context).postalcode(),
                      ),
                      onChanged: (value){
                        user.postalCode=value;
                      },
                    ),
                    
                 
                  ),
    );
  }

  _buildFirstName(){
    return  SlideTransition(
      position: pulseAnimation,
      child:  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
                    margin: EdgeInsets.only(
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
InputText(
                        icon: Icon(Icons.person_pin,
                            color: Colors.blueAccent[100],
                        ),
                        hintText:Translations.of(context).firstName() ,
                        labelText: Translations.of(context).firstName(),
                        errorText: 'نام الزامی است',
                        onChangedValue: (value) => _firstNameChanged(value),

                      )

                    //  TextField(
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.only(top: 4.0,bottom: 0.0,),
                    //     border: InputBorder.none,
                    //     icon: Icon(Icons.person_pin,
                    //         color: Colors.blueAccent[100],
                    //     ),
                    //     hintStyle: TextStyle(color: Colors.pinkAccent[100]),
                    //       hintText: Translations.of(context).firstName(),
                    //   ),
                    //   onChanged: (value){
                    //     user.firstName=value;
                    //   },
                    // ),
                    
                 
                  ),
    );
  }

  _buildAddress(){
    return  SlideTransition(
      position: pulseAnimation,
      child:  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                   margin: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
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
                    child: InputText(
                        icon: Icon(Icons.place,
                            color: Colors.blueAccent[100],
                        ),
                        hintText:Translations.of(context).address() ,
                        labelText: Translations.of(context).address(),
                        errorText: 'آدرس الزامی است',
                        onChangedValue: (value) => _addressChanged(value),

                      )
                    //  TextField(
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.only(top: 4.0,bottom: 0.0,),
                    //     border: InputBorder.none,
                    //     icon: Icon(Icons.person_pin,
                    //         color: Colors.blueAccent[100],
                    //     ),
                    //     hintStyle: TextStyle(color: Colors.pinkAccent[100]),
                    //       hintText: Translations.of(context).address(),
                    //   ),
                    //   onChanged: (value){
                    //     user.address=value;
                    //   },
                    // ),
                    
                 
                  ),
    );
  }

_buildTel(){
    return  SlideTransition(
      position: pulseAnimation,
      child:  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
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
                          hintText: Translations.of(context).tel(),
                      ),
                      onChanged: (value){
                        user.tel=value;
                      },
                    ),
                    
                 
                  ),
    );
  }

_buildSocialNo(){
    return  SlideTransition(
      position: pulseAnimation,
      child:  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
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
                          hintText: Translations.of(context).socialno(),
                      ),
                      onChanged: (value){
                        user.socialNo=value;
                      },
                    ),
                    
                 
                  ),
    );
  }


_buildRegister() {
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
                          // ApiCustomer apiCustomer=new ApiCustomer();
                          // apiCustomer=ApiCustomer.map(user);
                          BlocProvider.of<RegisterBloc>(context).dispatch(new LoadRegisterEvent(user,context));
                            //new SoapSaveCustomer(context: context).call(SoapConstants.METHOD_SAVE_CUSTOMER,  jsonEncode(apiCustomer));
                        },
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                        child: Text(Translations.of(context).register(), style: TextStyle(color: Colors.blueAccent)),
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
                          Navigator.popAndPushNamed(context, '/login');
                        },
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                        child: Text(Translations.of(context).exit(), style: TextStyle(color: Colors.blueAccent)),
                        color: Colors.transparent,
                      ),
                    ),
            )



      
      
    );
  }


    void _modalBottomSheet(Customer user){
          showModalBottomSheet(
          context: context,
          builder: (builder){
          return ConfirmLogin(user: user);
}
);
}

@override
  void initState() {
    
    super.initState();
    user=new Customer();
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
    Widget build(BuildContext context) {
      double w=MediaQuery.of(context).size.width;
      double h=MediaQuery.of(context).size.height;
      //final RegisterBloc _registerBloc=BlocProvider.of<RegisterBloc>(context);
    return BlocBuilder<RegisterEvent, RegisterState>(
        bloc: new RegisterBloc(),
        builder: (
          BuildContext context,
          RegisterState currentState,
        ) {
            if(currentState is UnRegisterState) {
          return
    Builder(
             builder: (BuildContext context) {
               return
                new Container(
                      margin: EdgeInsets.only(top: 25.0),
                      height: h/2.5,
                      child:
               new ListView(
                        
                                  scrollDirection: Axis.vertical,
                                  physics: new BouncingScrollPhysics(),
                                  children:<Widget>[
                
                   new Container(
                     margin: EdgeInsets.all(10.0),
                     height: 450,
                     child:
                        new ListView(
                        
                                  scrollDirection: Axis.vertical,
                                  physics: new BouncingScrollPhysics(),
                                  children:<Widget>[
                                              _buildFirstName()  ,
                                              _buildLastName(),
                                              _buildMobile(),
                                              _buildAddress(),
                new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildRegister(),
                    _buildExit(),
                    ],
              ),
                                          ],
                              ),
                   ),
                                      
                 ],
                ),
                );
             },
            
          );
        }
        if(currentState is InRegisterState)
        {
          return  LoadingIndicator();
        }
        if(currentState is RegisteredState)
        {
            Navigator.pushReplacementNamed(context, '/home');
        }
        if(currentState is ErrorRegisterState)
        {
          return new Container(
              child: new Center(
              child: new Text(currentState.errorMessage ?? 'Error' ),
            ));
        }
        return new Container(
              child: new Center(
            child: new Text(""),
          ));
             }
        
        
    );
    }
  
  
    
   
       
    
  

}