import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nardis/bloc/basic/bloc_provider.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nardis/bloc/basic/global_bloc.dart';
import 'package:nardis/bloc/search/index.dart';
import 'package:nardis/bloc/shopcart/cart.dart';
import 'package:nardis/bloc/shopcart/checkout_cart.dart';
import 'package:nardis/bloc/shopcart/shoppingcart.dart';
import 'package:nardis/components/logout_form.dart';
import 'package:nardis/components/marquee.dart';
import 'package:nardis/components/search_form.dart';
import 'package:nardis/data/database_helper.dart';
import 'package:nardis/data/fake_helper.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/server.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_brand_group.dart';
import 'package:nardis/data/soaps/soap_category.dart';
import 'package:nardis/data/soaps/soap_message.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_save_order.dart';
import 'package:nardis/data/soaps/special_offers.dart';
import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/customer.dart';
import 'package:nardis/models/message.dart';
import 'package:nardis/models/product_category_model.dart';
import 'package:nardis/models/products.dart';
import 'package:nardis/models/user.dart';
import 'package:nardis/models/viewmodels/offers_model.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/repository/order/order_repository.dart';
import 'package:nardis/repository/product/center_repository.dart';
import 'package:nardis/translation_strings.dart';
import 'package:nardis/ui/hiddendrawer/hidden_drawer/hidden_drawer_menu.dart';
import 'package:nardis/ui/hiddendrawer/hidden_drawer/screen_hidden_drawer.dart';
import 'package:nardis/ui/hiddendrawer/menu/item_hidden_menu.dart';
import 'package:nardis/ui/hiddendrawer/simple_hidden_drawer/provider/simple_hidden_drawer_provider.dart';
import 'package:nardis/ui/home/do_search.dart';
import 'package:nardis/ui/home/home.dart';
import 'package:nardis/ui/login/confirm_form.dart';
//import 'package:nardis/ui/home/home.dart' as prefix0;
import 'package:nardis/ui/login/confirm_login.dart';
import 'package:nardis/ui/login/logout_dialog.dart';
import 'package:nardis/ui/profile/profile2.dart';
import 'package:nardis/ui/screens/register_screen.dart';
import 'package:nardis/ui/shopping/shopping_cart_screen.dart';
import 'package:nardis/widgets/appbar_collapse.dart';
import 'package:nardis/widgets/curved_navigation_bar.dart';
import 'package:nardis/widgets/drawer/circular_image.dart';

import 'styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';

import 'homeAnimation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:after_layout/after_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => 
  new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin ,
    AfterLayoutMixin<HomeScreen>{

  List<ScreenHiddenDrawer> itens = new List();

  Animation<double> containerGrowAnimation;
  AnimationController _screenController;
  AnimationController _buttonController;
  Animation<double> buttonGrowAnimation;
  Animation<double> listTileWidth;
  Animation<Alignment> listSlideAnimation;
  Animation<Alignment> buttonSwingAnimation;
  Animation<EdgeInsets> listSlidePosition;
  Animation<Color> fadeScreenAnimation;
  var animateStatus = 0;

  ScrollController _controller;

  final String imageUrl = "";

  final int registerId=0;
  final int helpId=10;
  final int searchId=20;
  final int shopId=30;
  final int basketId=40;
  final int myProgramsId=50;
  List<ProductCategoryModel> categorys=new List();
  List<CategoryItem> catItems=new List();

  List<ProductSummary> offers=new List();
  List<ProductOffers> offerItems=new List();
  
  List<CategoryItem> brandItems=new List();
  List<ProductCategoryModel> brands=new List();

  Server server=new Server();
  StreamSubscription<String> _subscription;
  String message='';
  Customer customer;
  bool isLoginned=true;
  
  int _counter=0;
  double _amountOrders=0;

  CartBloc _cartBloc;
  User user;

  List createHomeScrollList()
  {
    final List scrollContents = [

      Container(
        padding: EdgeInsets.only(top: 4.0),
        /*decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.grey[50],
              Colors.grey[50],
              Colors.grey[50],
              Colors.grey[50],
            ],
          ),
        ),*/

        child:
        new Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.adjust, size: 35.0, color: Colors.pink),

              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    Translations.of(context).offers(),
                    style: TextStyle(color: Colors.pink,
                        fontSize: 15,

                        fontWeight: FontWeight.w400),

                  )
              )
            ]
        ),

      ),
   
               buildOffersRow( offerItems.map((item) => item.toMap()).toList()),
    
      Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.grey[50],
              Colors.grey[50],
              Colors.grey[50],
              Colors.grey[50],
            ],
          ),
        ),

        child:
        new Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Icon(Icons.adjust, size: 35.0, color: Colors.pink),
              Align(
                  alignment: Alignment.center,
                  child:
                  new Text(
                    Translations.of(context).productcategory(),
                    style: TextStyle(color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )
              )
            ]
        ),

      ),
      buildCollectionsRow(catItems.map((data) => data.toMap(data)).toList()),
      Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.grey[50],
              Colors.grey[50],
              Colors.grey[50],
              Colors.grey[50],
            ],
          ),
        ),

        child:
        new Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Icon(Icons.adjust, size: 35.0, color: Colors.pink),
              Align(
                  alignment: Alignment.center,
                  child:
                  new Text(
                    Translations.of(context).brands(),
                    style: TextStyle(color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )
              )
            ]
        ),

      ),
      buildBrandsRow(brandItems.map((data) => data.toMap(data)).toList()),

    ];
    return scrollContents;
  }
  updateItemCounts(bool increment)
  {
   //setState(() {
     if(increment)
       this._counter=this._counter+1;
     else
     if(this._counter > 0)
       this._counter=this._counter-1;
   //});
  }

  updateCheckOutAmounts(bool increment,double amount)
  {
   //setState(() {
     if(increment)
       this._amountOrders=this._amountOrders+amount;
     else
     if( this._amountOrders>=amount)
       this._amountOrders=this._amountOrders-amount;
   //});
  }
  
  Widget createScrollContents(BuildContext context,int index) {
    final List scrollContents = [

      Container(
        padding: EdgeInsets.only(top: 10.0),
        /*decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.grey[50],
              Colors.grey[50],
              Colors.grey[50],
              Colors.grey[50],
            ],
          ),
        ),*/

        child:
        new Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.adjust, size: 35.0, color: Colors.pink),

              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    Translations.of(context).offers(),
                    style: TextStyle(color: Colors.pink,
                        fontSize: 15,

                        fontWeight: FontWeight.w400),

                  )
              )
            ]
        ),

      ),
      // BlocBuilder<CartEvent,CartState>(
      //       bloc:_cartBloc,
      //       builder: (BuildContext contxt,CartState state) {
               buildOffersRow( offerItems.map((item) => item.toMap()).toList()),
          //  },
      //),
      Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.grey[50],
              Colors.grey[50],
              Colors.grey[50],
              Colors.grey[50],
            ],
          ),
        ),

        child:
        new Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Icon(Icons.adjust, size: 35.0, color: Colors.pink),
              Align(
                  alignment: Alignment.center,
                  child:
                  new Text(
                    Translations.of(context).productcategory(),
                    style: TextStyle(color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )
              )
            ]
        ),

      ),
      buildCollectionsRow(catItems.map((data) => data.toMap(data)).toList()),
      Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.grey[50],
              Colors.grey[50],
              Colors.grey[50],
              Colors.grey[50],
            ],
          ),
        ),

        child:
        new Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Icon(Icons.adjust, size: 35.0, color: Colors.pink),
              Align(
                  alignment: Alignment.center,
                  child:
                  new Text(
                    Translations.of(context).brands(),
                    style: TextStyle(color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )
              )
            ]
        ),

      ),
      buildBrandsRow(brandItems.map((data) => data.toMap(data)).toList()),

    ];

    if(index==0)
      return scrollContents[0];
    else if(index==1)
      return scrollContents[1];
    else if(index==2)
      return scrollContents[2];
    else if(index==3)
      return scrollContents[3];
    else if(index==4)
      return scrollContents[4];
      else if(index==5)
      return scrollContents[5];
  }


 

  Color clr = Colors.lightBlueAccent;
  _scrollListener() {
    if (_controller.offset > _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        clr = Colors.blueAccent;
      });
    }

    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        clr = Colors.lightBlueAccent;
      });
    }

  }


void initLists()
{
  categorys=repository.getListOfCategory();
  catItems=categorys.map((item) =>
    new CategoryItem(item.name, '',item.code,item.name,SoapOpersConstants.CATEGORY)).toList();

   offers=repository.getMapOfProductsInCategory()[SoapOpersConstants.OFFERS]; 
   offerItems=offers.map((item) => 
    new ProductOffers(allt: item.allt,
   code: item.code,
   description: item.description,
   name: item.name,
   priceB: item.priceB,
   priceC: item.priceC,
   imageUrl: SoapConstants.URL_IMAGE+item.code+'.jpg')).toList();

  brands=repository.getListOfBrandCategory();
  brandItems=brands.map((item) =>
    new CategoryItem(item.name,
  SoapConstants.URL_IMAGE+item.code+'.jpg',
  item.code,item.name,SoapOpersConstants.BRANDGROUPS)).toList();


  _controller = ScrollController();
    _controller.addListener(_scrollListener);
    _screenController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);
    _buttonController = new AnimationController(
        duration: new Duration(milliseconds: 1500), vsync: this);

    fadeScreenAnimation = new ColorTween(
      begin: const Color.fromRGBO(247, 64, 106, 1.0),
      end: const Color.fromRGBO(247, 64, 106, 0.0),
    ).animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: Curves.ease,
      ),
    );
    containerGrowAnimation = new CurvedAnimation(
      parent: _screenController,
      curve: Curves.easeIn,
    );

    buttonGrowAnimation = new CurvedAnimation(
      parent: _screenController,
      curve: Curves.easeOut,
    );
    containerGrowAnimation.addListener(() {
      this.setState(() {});
    });
    containerGrowAnimation.addStatusListener((AnimationStatus status) {});

    listTileWidth = new Tween<double>(
      begin: 1000.0,
      end: 600.0,
    ).animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: new Interval(
          0.225,
          0.600,
          curve: Curves.bounceIn,
        ),
      ),
    );

    listSlideAnimation = new AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: new Interval(
          0.325,
          0.700,
          curve: Curves.ease,
        ),
      ),
    );
    buttonSwingAnimation = new AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
    ).animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: new Interval(
          0.225,
          0.600,
          curve: Curves.ease,
        ),
      ),
    );
    listSlidePosition = new EdgeInsetsTween(
      begin: const EdgeInsets.only(bottom: 16.0),
      end: const EdgeInsets.only(bottom: 80.0),
    ).animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: new Interval(
          0.325,
          0.800,
          curve: Curves.ease,
        ),
      ),
    );
    _screenController.forward();
   
}

initCustomer() async
{
   user=await databaseHelper.getUserInfo();
  if(user!=null)
  {
    customer=new Customer();
    customer.code=user.code;
    customer.mobile=user.mobile;
    isLoginned=true;  
  }
  else{
    isLoginned=false;
  }
}
void registerBus() {
    RxBus.register<ChangeEvent>().listen((ChangeEvent event)  {
      
      if( event.message=='INCREMENT_COUNTER')
         updateItemCounts(true);
      if(event.message=='DECREMENT_COUNTER')
         updateItemCounts(false);
      if(event.message=='DECREMENT_AMOUNT')
         updateCheckOutAmounts(false, event.amount);
      if(event.message=='INCREMENT_AMOUNT')
         updateCheckOutAmounts(true, event.amount);
         if(event.message=='USER_LOADED')
         {

         }
         if(event.message=='USER_LOADED_ERROR')
         {

         }
      setState(()  => { 
    
    });
    });
  }
  
  @override
  void initState() {
    super.initState();

    initCustomer();   
   // registerBus();
    initLists();
    
  }

  @override
  void dispose() {
    _screenController.dispose();
    _buttonController.dispose();
    //_subscription.cancel();
    RxBus.destroy();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }




  @override
  Widget build(BuildContext context) {
    timeDilation = 0.3;
    Size screenSize = MediaQuery
        .of(context)
        .size;
    
    // return  BlocProvider<CartBloc>(
    //   builder: (context) => _cartBloc ,
    //   child: 
  
        return
          new WillPopScope(
        onWillPop: () async {
          return true;
        },
        child:
        
        HiddenDrawerMenu(
          initPositionSelected: 0,
          elevationAppBar: 0.0,
          screens: itens,

          backgroundColorMenu: Colors.blueAccent[400],
          bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent[400],
          items: <Widget>[
            Icon(Icons.account_circle, size: 30,color: Color(0xff455a64)),
            Icon(Icons.check_circle_outline, size: 30,color: Color(0xff455a64)),
            Icon(Icons.search, size: 30,color: Color(0xff455a64)),
            Icon(Icons.shopping_cart, size: 30,color: Color(0xff455a64)),
            Icon(Icons.exit_to_app, size: 30,color: Color(0xff455a64),),
          ],
          onTap: (index) {
            //Handle button tap
            onNavButtonTap(index);
          },

        ),
          //    enableScaleAnimin: true,
          //    enableCornerAnimin: true,
          //    slidePercent: 80.0,
          //    verticalScalePercent: 80.0,
          //    contentCornerRadius: 10.0,
          //    iconMenuAppBar: Icon(Icons.menu),
          //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
          //    whithAutoTittleName: true,
          //    styleAutoTittleName: TextStyle(color: Colors.red),
              actionsAppBar: <Widget>[
                
          
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child:
                 
           IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/shoppingcart');
                  },
                  icon: 
                  //Icon(Icons.shopping_cart, color: Colors.white, size: 32,semanticLabel: "Cart",),
                  new Stack(
    children: <Widget>[
      new Icon(Icons.shopping_cart, color: Colors.white, size: 32,semanticLabel: "Cart",),
      new Positioned(
        right: 0,
        child: new Container(
          padding: EdgeInsets.all(1),
          decoration: new BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(6),
          ),
          constraints: BoxConstraints(
            minWidth: 12,
            minHeight: 12,
          ),
          child: StreamBuilder(
        stream:
            BlocProvider.of<GlobalBloc>(context).shoppingCartBloc.cartStream,
        initialData: ShoppingCart(),
        builder: (context, snapshot) {
          int count = 0;
          if (snapshot.hasData) {
            if (snapshot.data is ShoppingCart) {
              count = snapshot.data.products.length;
            }
            if(snapshot.data is Message)
              {

              }
          }
          return 
          new Text(
            count.toString(),
            style: new TextStyle(
              color: Colors.white,
              fontSize: 8,
            ),
            textAlign: TextAlign.center,
          );
        }),
        ),
      )
    ],
  )
                
                )
                  
               // },)
                )
              ],
          //    backgroundColorContent: Colors.blue,
          //    backgroundColorAppBar: Colors.blue,
             // elevationAppBar: 0.0,
          //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
          //    enableShadowItensMenu: true,
          //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
                   ),
       
        
            
            
          //  },
          
      /*new ZoomScaffold(
          menuScreen: MenuScreen(),
          contentScreen: Layout(
            contentBuilder: (cc) => AppBarCollaps(_controller,clr)


          ),
        )*/
        );
  }

loaduser() async
{
    return await databaseHelper.getUserInfo() ; 
}
  void onNavButtonTap(int index) {
    if (index == 4) {
     // Navigator.pushReplacementNamed(context, '/coachs');
     SystemNavigator.pop();
    }
    else if(index==0)
    {
      Navigator.pushReplacementNamed(context, '/myprofile',arguments: user);
    }
    else if(index==1)
    {
      BlocProvider.of<GlobalBloc>(context)
                                  .shoppingCartBloc
                                  .checkOutcart(context);
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text(Translations.current.sendordersuccessful())));
                              Navigator.pushReplacementNamed(
                                context,
                                '/home'
                              );

    }
    else if(index==2)
    {
       Navigator.pushReplacementNamed(context, '/search');
    }
    else if(index==3)
    {
      Navigator.pushReplacementNamed(context, '/shoppingcart',);
    }
  }



  void createMenuContent(BuildContext context)
  {
    itens.add(new ScreenHiddenDrawer(
      new ItemHiddenMenu(
        name: Translations.of(context).home(),
        colorLineSelected: Colors.teal,
        baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 25.0 ),
        selectedStyle: TextStyle(color: Colors.teal),
        content: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircularImage(
                NetworkImage(imageUrl),
              ),
            ),
            Text(Translations.of(context).userName(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
      AppBarCollaps(_controller, clr,createHomeScrollList()),
      // Stack(
        
      
      //   children: <Widget>[
      //     Container(
      //       height: 60.0,
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             colors: [Colors.indigo.shade300, Colors.indigo.shade500]
      //         ),
      //       ),
      //       child:
      //        Row(
      //          children:<Widget>[
      //                new Text('مبلغ سفارش : ',style: new TextStyle(fontSize: 18.0,color: Colors.white),),
      //                new Text('0',style: new TextStyle(fontSize: 15.0,color: Colors.white),),
      //          ],
      //        ),
      //     ),
      //     ListView.builder(
      //       padding: EdgeInsets.only(top: 60.0),
      //       itemCount: 6,
      //       itemBuilder: createScrollContents,
      //     ),

      //   ],
      // ),
    ));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: Translations.of(context).register(),
          colorLineSelected: Colors.orange,
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 25.0 ),
          selectedStyle: TextStyle(color: Colors.orange),
          content:
          ListTile(
            onTap: (){},
            leading: Icon(Icons.person_add, color: Colors.white, size: 20,),
            title: Text(Translations.of(context).register(),
                style: TextStyle(
                    fontSize: 14,
                    color: isLoginned ? Colors.grey : Colors.white,
                    fontWeight: FontWeight.bold
                )),),
        ),
        isLoginned ? new LogoutDialog() :  new RegisterScreen()
        ));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: Translations.of(context).search(),
          colorLineSelected: Colors.orange,
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 25.0 ),
          selectedStyle: TextStyle(color: Colors.orange),
          content: ListTile(
            onTap: (){},
            leading: Icon(Icons.search, color: Colors.white, size: 20,),
            title: Text(Translations.of(context).search(),
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                )),),
        ),
      new SearchPage(),
        ));
    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: Translations.of(context).basket(),
          colorLineSelected: Colors.orange,
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 25.0 ),
          selectedStyle: TextStyle(color: Colors.orange),
          content: ListTile(
            leading: Icon(Icons.shopping_cart, color: Colors.white, size: 20,),
            title: Text(Translations.of(context).basket(),
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                )),),
        ),
       new ShoppingCartScreen()
        ));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: !isLoginned ? Translations.of(context).login() :  Translations.of(context).exit(),
          colorLineSelected: Colors.orange,
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 25.0 ),
          selectedStyle: TextStyle(color: Colors.orange),
          content: ListTile(
            leading: Icon(Icons.sync_problem, color: Colors.white, size: 20,),
            title: Text(!isLoginned ? Translations.of(context).login() : 
            Translations.of(context).exit(),
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                )),),
        ),
      Container(
          color: Colors.orange,
          child: Center(
            child:LogoutDialog() ,
          ),
        )
        ));

    // itens.add(new ScreenHiddenDrawer(
    //     new ItemHiddenMenu(
    //       name: Translations.of(context).profile(),
    //       colorLineSelected: Colors.orange,
    //       baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 25.0 ),
    //       selectedStyle: TextStyle(color: Colors.orange),
    //       content: ListTile(
    //         leading: Icon(Icons.person_pin, color: Colors.white, size: 20,),
    //         title: Text(Translations.of(context).profile(),
    //             style: TextStyle(
    //                 fontSize: 14,
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold
    //             )),),
    //     ),
    //     new ProfileTwoPage(Helper.createUser())
    // ));

    // itens.add(new ScreenHiddenDrawer(
    //     new ItemHiddenMenu(
    //       name: Translations.of(context).settings(),
    //       colorLineSelected: Colors.orange,
    //       baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 20.0 ),
    //       selectedStyle: TextStyle(color: Colors.orange),
    //       content: ListTile(
    //         leading: Icon(Icons.settings, color: Colors.white, size: 20,),
    //         title: Text(Translations.of(context).settings(),
    //             style: TextStyle(
    //                 fontSize: 14,
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold
    //             )),),
    //     ),
    //     Container(
    //       color: Colors.orange,
    //       child: Center(
    //         child: Text(
    //           "Screen 2",
    //           style: TextStyle(color: Colors.redAccent, fontSize: 30.0),
    //         ),
    //       ),
    //     )));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: Translations.of(context).support(),
          colorLineSelected: Colors.orange,
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 20.0 ),
          selectedStyle: TextStyle(color: Colors.orange),
          content: ListTile(
            leading: Icon(Icons.headset_mic, color: Colors.white, size: 20,),
            title: Text(Translations.of(context).support(),
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                )),),
        ),
        Container(
          color: Colors.white,
          child: Center(
            child: Text(
               Translations.of(context).title(),
              style: TextStyle(color: Colors.redAccent, fontSize: 30.0),
            ),
          ),
        )));
  }
  List<MenuItem> createMenuList(BuildContext context){
    final List<MenuItem> options = [
      MenuItem(Icons.person_add, Translations.of(context).register(),context,registerId),
      MenuItem(Icons.search, Translations.of(context).search(),context,searchId),
      MenuItem(Icons.shopping_basket, Translations.of(context).basket(),context,basketId),
     // MenuItem(Icons.transfer_within_a_station, Translations.of(context).coach(),context,-1),
      //MenuItem(Icons.list, Translations.of(context).myPrograms(),context,myProgramsId),
      MenuItem(Icons.help, Translations.of(context).help(),context,helpId),

    ];
    return options;
  }
  _modalBottomSheet(Customer user){
      return showModalBottomSheet(
        context: context,
        builder: (builder){
  return LogoutDialog(user: user);
    }
      );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    createMenuContent(context);
  }

}

class MenuItem{
  int id;
  String title;
  IconData icon;
  BuildContext context;
  MenuItem(this.icon, this.title,this.context,this.id);

}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.cyan,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                SimpleHiddenDrawerProvider.of(context)
                    .setSelectedMenuPosition(0);
              },
              child: Text("Menu 1"),
            ),
            RaisedButton(
                onPressed: () {
                  SimpleHiddenDrawerProvider.of(context)
                      .setSelectedMenuPosition(1);
                },
                child: Text("Menu 2"))
          ],
        ),
      ),
    );
  }
}
