import 'package:flutter/material.dart';
import 'package:nardis/bloc/basic/bloc_provider.dart';
import 'package:nardis/bloc/basic/global_bloc.dart';
import 'package:nardis/bloc/shopcart/shoppingcart_bloc.dart';
import 'package:nardis/components/fancy_background.dart';
import 'package:nardis/data/database_helper.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_brand_group.dart';
import 'package:nardis/data/soaps/soap_category.dart';
import 'package:nardis/data/soaps/soap_get_appversion.dart';
import 'package:nardis/data/soaps/soap_message.dart';
import 'package:nardis/data/soaps/special_offers.dart';
import 'dart:async';
import 'dart:math';

import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/shopcart_model.dart';
import 'package:nardis/models/viewmodels/shopping_cart_product_vm.dart';
import 'package:nardis/translation_strings.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);
 
  @override
  _LoadingScreenState createState() => new _LoadingScreenState();
 
}
 
class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
 
  bool _loadingInProgress;
  String message='';
  Animation<double> _angleAnimation;
 
  Animation<double> _scaleAnimation;
 
  AnimationController _controller;

 void registerBus() {
    RxBus.register<ChangeEvent>().listen((ChangeEvent event) {
        

          message = event.message;
          if(event.message=='CATEGORY_LOADED') {
            SpecialOffers offers=new SpecialOffers();
            offers.call(SoapConstants.METHOD_NAME, context);
          }
          else if(event.message=='OFFERS_LOADED')
          {
            SoapBrandGroups brand=new SoapBrandGroups(context: context);
            brand.call(SoapConstants.METHOD_NAME_BRAND, context);
          }
          else if(event.message=='BRAND_LOADED')
          {
            SoapMessage msg=new SoapMessage();
            msg.call(SoapConstants.METHOD_NAME_GET_MESSAGE);
          }
          else if(event.message=='MESSAGE_LOADED')
          {
            SoapAppVersion appVersion=new SoapAppVersion(context: context);
            appVersion.call(SoapConstants.METHOD_NAME_GET_APP_VERSION);
          //  _dataLoaded();
          //   Navigator.pushReplacementNamed(context, '/home');
           
          }
          else if(event.message=='APP_VERSION_CHECKED_VALID')
          {
            _loadItemsInCart();      
            _dataLoaded();
            Navigator.pushReplacementNamed(context, '/home');
          }
          else if(event.message=="APP_VERSION_CHECKED_NOTVALID")
          {
            
          }
    });
  }

void _loadItemsInCart() async {
  List<ShopCartModel> itemsInCart=new List();
  itemsInCart= await databaseHelper.getShopCartItems();
  if(itemsInCart!=null && itemsInCart.length>0)
  {
    ShoppingCartBloc _shopBloc=BlocProvider.of<GlobalBloc>(context).shoppingCartBloc;
    itemsInCart.forEach((i) =>
        _shopBloc.addition.add(ShoppingCartProductVM.fromShopCartModel(i))
    );
  }
}
  @override
  void initState() {
    super.initState();
    _loadingInProgress = true;
    registerBus();
    

_controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _angleAnimation = new Tween(begin: 0.0, end: 360.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    _scaleAnimation = new Tween(begin: 1.0, end: 6.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
 
    _angleAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_loadingInProgress) {
          _controller.reverse();
        }
      } else if (status == AnimationStatus.dismissed) {
        if (_loadingInProgress) {
          _controller.forward();
        }
      }
    });
 
    _controller.forward();

    _loadData();

  }
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
  
      body: FancyBackgroundApp(),
    );
  }
 

  Widget _buildBody() {
    if (_loadingInProgress) {
      return new Stack(
      children: [
        new Center(
          child:
      new Text(Translations.current.loadingdata(),
      style: new TextStyle(fontSize: 15.0,color: Colors.pinkAccent),)
      ),
      new Center(
        child: _buildAnimation(),
      )
      ],
      );
    } else {
      return new Center (
        child: new Text(Translations.current.dataloaded()),
      );
    }
  }
 
Widget _buildAnimation() {
    double circleWidth = 10.0 * _scaleAnimation.value;
    Widget circles = new Container(
      width: circleWidth * 2.0,
      height: circleWidth * 2.0,
      child: new Column(
        children: <Widget>[
          new Row (
              children: <Widget>[
                _buildCircle(circleWidth,Colors.blue),
                _buildCircle(circleWidth,Colors.red),
              ],
          ),
          new Row (
            children: <Widget>[
              _buildCircle(circleWidth,Colors.yellow),
              _buildCircle(circleWidth,Colors.green),
            ],
          ),
        ],
      ),
    );
 
    double angleInDegrees = _angleAnimation.value;
    return new Transform.rotate(
      angle: angleInDegrees / 360 * 2 * pi,
      child: new Container(
        child: circles,
      ),
    );
  }
 
  Widget _buildCircle(double circleWidth, Color color) {
    return new Container(
      width: circleWidth,
      height: circleWidth,
      decoration: new BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

 Future _loadData() async {
    SoapCategory soapCategory=new SoapCategory(context:context);
    soapCategory.call(SoapConstants.METHOD_NAME_CATEGORY, context);
   // _dataLoaded();
  }
 
  void _dataLoaded() {
    setState(() {
      _loadingInProgress = false;
    });
  }

@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}