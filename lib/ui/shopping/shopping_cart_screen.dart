import 'package:flutter/material.dart';
import 'package:nardis/bloc/basic/bloc_provider.dart';
import 'package:nardis/bloc/basic/global_bloc.dart';
import 'package:nardis/bloc/shopcart/shoppingcart.dart';
import 'package:nardis/models/message.dart';
import 'package:nardis/models/viewmodels/shopping_cart_product_vm.dart';
import 'package:nardis/translation_strings.dart';

class ShoppingCartScreen extends StatefulWidget {
  ShoppingCartScreen();

  final String title = "Shopping Cart";


  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCartScreen> with TickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ShoppingCart cart;

AnimationController formAnimationController;
Animation buttonAnimation;
Animation<Offset> pulseAnimation;
   
   _buildConfirmOrder() {
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
                              _confirmOrder();
                        },
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                        child: Text(Translations.of(context).sendorder(), style: TextStyle(color: Colors.blueAccent)),
                        color: Colors.transparent,
                      ),
                    ), 
            )



      
      
    );
  }

  _confirmOrder()
  {
    BlocProvider.of<GlobalBloc>(context)
                                  .shoppingCartBloc
                                  .checkOutcart(context);
                              
                                 
                              
  }

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

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: _scaffoldKey,
        appBar:AppBar(
        
          leading:
          IconButton(
           icon:Icon( Icons.arrow_forward_ios),
          onPressed: ()=> 
              Navigator.pushReplacementNamed(context, '/home')
          ,),
          title: Text(Translations.current.basket(),
          style: new TextStyle(color: Colors.white,fontSize: 18.0),)
        ),
        body: 
        StreamBuilder(
        initialData: null,
        stream: BlocProvider.of<GlobalBloc>(context).messageBloc.messageStream,
        builder: (BuildContext context, AsyncSnapshot<Message> snapshot) {
          if(snapshot.hasData){
          Message msg = snapshot.data;
            if(msg.text=='ORDER_SAVED' &&
            msg.type=='success')
            {
              BlocProvider.of<GlobalBloc>(context)
                  .shoppingCartBloc.clearCart();
                _scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text('ارسال با موفقیت ا نجام شد',style: TextStyle(fontSize: 15.0,),),action: SnackBarAction(label: 'خروج',onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');}),),);
            }
          }
       return
        StreamBuilder(
            stream: BlocProvider.of<GlobalBloc>(context)
                .shoppingCartBloc
                .cartStream,
            builder: (context, snapshot) {
              
              if (!snapshot.hasData) {
                return Center(child: Text(Translations.current.bascketisempty()));
              } else {
                cart = snapshot.data;
                if (cart.products.length == 0) {
                  return Center(child: Text(Translations.current.bascketisempty()));
                }
                return Container(
                    padding: EdgeInsets.all(16),
                    child: Column(children: [
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            Card(
                              child: ListTile(
                                leading: Text(Translations.current.totalsum(),
                                    style: Theme.of(context).textTheme.subhead),
                                trailing: Text(cart.priceNet.toString() + " IRR ",
                                    style:
                                        Theme.of(context).textTheme.headline),
                              ),
                            ),
                            Card(
                              child: ExpansionTile(
                                  title: Text(Translations.current.products()+ " (" +
                                      cart.products.length.toString() +
                                      ")"),
                                  children: getProductTiles()),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: _buildConfirmOrder(),
                        ),
                      )
                    ]));
              }
            });
        }),
            );
  }

  List<Widget> getProductTiles() {
    List<Widget> list = [];
    if (cart != null) {
      for (ShoppingCartProductVM p in cart.products) {
        String name = p.name;
        String price = p.priceB.toString();
        String count=p.count.toString();
        list.add(ListTile(
          title: Text(name),
          subtitle: Text( ' IRR '+price +Translations.current.counts()+' : '+ count),
          trailing: FlatButton(
            padding: EdgeInsets.only(left: 0, right: 0),
            child: Icon(Icons.remove_shopping_cart,size: 28.0, color: Colors.red),
            onPressed: () {
              if(p.count>0)
                p.count=p.count-1;
              BlocProvider.of<GlobalBloc>(context)
                  .shoppingCartBloc
                  .substraction
                  .add(p);
            },
          ),
        ));
      }
    }
    return list;
  }
}