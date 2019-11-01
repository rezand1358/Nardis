import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nardis/bloc/basic/bloc_provider.dart' as cart;
import 'package:nardis/bloc/basic/global_bloc.dart';
import 'package:nardis/bloc/register/register.dart';
import 'package:nardis/components/do_download.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_brand_group.dart';
import 'package:nardis/data/soaps/soap_category.dart';
import 'package:nardis/data/soaps/soap_get_appversion.dart';
import 'package:nardis/data/soaps/soap_message.dart';
import 'package:nardis/data/soaps/special_offers.dart';
import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/customer.dart';
import 'package:nardis/models/user.dart';
import 'package:nardis/repository/download/download_repository.dart';
import 'package:nardis/repository/user/user_repository.dart';
import 'package:nardis/translation_strings.dart';
import './InputFields.dart';

class FormValidation extends StatefulWidget
{

  Customer user;
  FormValidation({this.user});

  @override
  FormContainerValidation createState() {
    
    return FormContainerValidation();
  }
  
}

class FormContainerValidation extends State<FormValidation> 
with TickerProviderStateMixin{

AnimationController formAnimationController;
Animation buttonAnimation;
Animation<Offset> pulseAnimation;
String message='';
VoidCallback _showBottomSheetCallback;
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
registerEvent()
{
  RxBus.register<ChangeEvent>().listen((event) => setState(() {
          message = event.message;
          if(message=='CATEGORY_LOADED') {
            SpecialOffers offers=new SpecialOffers();
            offers.call(SoapConstants.METHOD_NAME, context);
          }
          else if(message=='OFFERS_LOADED')
          {
            SoapBrandGroups brand=new SoapBrandGroups(context: context);
            brand.call(SoapConstants.METHOD_NAME_BRAND, context);
          }
          else if(message=='BRAND_LOADED')
          {
            SoapMessage msg=new SoapMessage();
            msg.call(SoapConstants.METHOD_NAME_GET_MESSAGE);
          }
          else if(message=='MESSAGE_LOADED')
          {
            SoapAppVersion appVersion=new SoapAppVersion(context: context);
            appVersion.call(SoapConstants.METHOD_NAME_GET_APP_VERSION);
          }
          else if(message=='CUSTOMER_SAVED')
          {
            BlocProvider.of<RegisterBloc>(context).dispatch(new RegisteredEvent());
          }
          else if(message=='APP_VERSION_CHECKED_VALID')
          {
            cart.BlocProvider.of<GlobalBloc>(context).shoppingCartBloc.loadItemsInCart();
            Navigator.pushReplacementNamed(context, '/home');
          }
          else if(message=='APP_VERSION_CHECKED_NOTVALID') {
            _modalBottomSheetDownload();
          }
  
}));
}

void _modalBottomSheetDownload(){
  showModalBottomSheet(
      context: context,
      builder: (builder){
        return DownloadAPK();
      }
  );
}

String securityCode='';
  @override
  void initState() {
    
    super.initState();

    
    registerEvent();
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

  _confirmCode()
  {
    if(widget.user.password==securityCode)
    {
      
      UserRepository userRepo=new UserRepository();
      //userRepo.authenticate(username: widget.user.mobile,password: widget.user.password,code: widget.user.code);
      userRepo.authenticateUser(user:widget.user);
      /*SoapCategory category=new SoapCategory(context: context);
      category.call(SoapConstants.METHOD_NAME_CATEGORY, context);*/
      Navigator.pushReplacementNamed(context, '/loading');
    }
    else{
      Scaffold.of(context).showSnackBar(new SnackBar(
        content:new Text('خطا در کد امنیتی') ,

      ));
    }
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
                         //new SoapCustomer(context: context).call(SoapConstants.METHOD_NAME_CUSTOMER_LOGIN, 'MobileNo', mobile);
                         _confirmCode();
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
                            Navigator.pop(context);
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
                          hintText: Translations.of(context).confirmSecurityCode(),
                      ),
                      onChanged: (value){
                        this.securityCode=value;
                      },
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
        child: /*Column(
          children: <Widget>[*/
        ListView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
            
Container(
              width: w,
              height: 90,
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
                    child: Icon(Icons.security,
                      size: 15,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Spacer(),

                  Align(
                    alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 5,
                          right: 5
                        ),
                        child: Text(Translations.of(context).confirmSecurityCode(),
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
              padding: EdgeInsets.only(top: 25),
              child:
            Column(
              children: <Widget> [
                    _buildUsername(),
                  ]
            ),
            ),     
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
      )
    );
  }
  @override
  void dispose() {
    formAnimationController.dispose();
    super.dispose();
  }


void _showPersistBottomSheet() {
  setState(() { // disable the button
    _showBottomSheetCallback = null;
  });
  _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return new Container(
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
              title: new Text('نسخه جدسد برنامه در دسترس میباشد.جهت دریافت و نصب دکمه دریات را لمس کنید'),
              onTap: () => null,
            ),
            new DownloadAPK(),
            GestureDetector(
              onTap:() {
                setState(() { // re-enable the button
                  _showBottomSheetCallback = null;
                });
              },
              child:
              new DoDownload(),
            ),
          ],
        ),
      ),
    );
  })
      .closed.whenComplete(() {
    if (mounted) {
      setState(() { // re-enable the button
        _showBottomSheetCallback = _showPersistBottomSheet;
      });
    }
  });
}
}
