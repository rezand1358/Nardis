import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nardis/bloc/basic/bloc_provider.dart';
import 'package:nardis/bloc/basic/global_bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:jaguar_orm/jaguar_orm.dart';

import 'package:nardis/bloc/shopcart/cart.dart';
import 'package:nardis/bloc/shopcart/checkout_cart.dart';
import 'package:nardis/bloc/shopcart/shoppingcart.dart';
import 'package:nardis/components/CircleImage.dart';
import 'package:nardis/components/GMenu.dart';
import 'package:nardis/components/myprograms_form.dart';
import 'package:nardis/components/text_marquee.dart';
import 'package:nardis/data/fake_helper.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/models/products.dart';
import 'package:nardis/models/user.dart';
import 'package:nardis/models/viewmodels/product_details_vm.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/models/viewmodels/shopping_cart_product_vm.dart';
import 'package:nardis/repository/product/center_repository.dart';
import 'package:nardis/translation_strings.dart';
import 'package:nardis/utils/marquee_widget.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:nardis/models/change_event.dart';

class ProductDetails extends StatefulWidget {

  ProductDetailsVM productDetailsVM;
  List<Map> products =new List();
  List<ProductSummary> allProducts =new List();
  List<ProductSummary> productFiltered =new List();

  User user;
  String code="";
  int position=0;
  bool isFromCart=false;
  String categorykey='';

  ProductSummary product;
  ProductDetails(this.user,this.categorykey,this.productDetailsVM,this.isFromCart);

 @override
  _ProductDetailsState createState() {

    return _ProductDetailsState();
  }
}
class _ProductDetailsState extends State<ProductDetails>
{


  int count=0;
  _loadData()
  {
    widget.position=widget.productDetailsVM.position;
    widget.code= widget.productDetailsVM.productSummary.code;
      if(widget.productDetailsVM!=null &&
     widget.productDetailsVM.productSummary==null ){
      widget.product=new ProductSummary();
      if(!widget.isFromCart)  {
      List<ProductSummary> fpList=repository.getMapOfProductsInCategory()[widget.categorykey].where((p) => p.code==widget.code).toList();
      if(fpList!=null && fpList.length>0 && fpList[0]!=null)
        widget.product=fpList[0];
      else
        widget.product=null;

      if(widget.product==null)
      {
          widget.allProducts=repository.getMapOfProductsInCategory()[widget.categorykey];
          if(widget.allProducts!=null &&
          widget.allProducts.length>0)
          {
            widget.productFiltered=widget.allProducts.where((p)=> p.code==widget.code).toList();
            if(widget.productFiltered!=null &&
            widget.productFiltered.length>0)
            {
              widget.product=widget.productFiltered[0];
              widget.code=widget.productFiltered[0].code;
            }
          }
      }
      }
      else
      {
        widget.product=repository.getListOfProductsInShoppingList().where((p)=> p.code==widget.code).toList()[0];
      if(widget.product==null)
      {
          widget.allProducts=repository.getListOfProductsInShoppingList();
          if(widget.allProducts!=null &&
          widget.allProducts.length>0)
          {
            widget.productFiltered=widget.allProducts.where((p)=> p.code==widget.code).toList();
            if(widget.productFiltered!=null &&
            widget.productFiltered.length>0)

            {
              widget.product=widget.productFiltered[0];
              widget.code=widget.productFiltered[0].code;
            }
          }
      }
      }
     }
     else
     {
       widget.product=new ProductSummary();
      if(!widget.isFromCart)  {
      widget.product=widget.productDetailsVM.productSummary;
      if(widget.product==null)
      {
          widget.allProducts=repository.getMapOfProductsInCategory()[widget.categorykey];
          if(widget.allProducts!=null &&
          widget.allProducts.length>0)
          {
            widget.productFiltered=widget.allProducts.where((p)=> p.code==widget.code).toList();
            if(widget.productFiltered!=null &&
            widget.productFiltered.length>0)
            {
              widget.product=widget.productFiltered[0];
              widget.code=widget.productFiltered[0].code;
            }
          }
      }
      }
      else
      {
        widget.product=repository.getListOfProductsInShoppingList().where((p) => p.code==widget.code).toList()[0];
      if(widget.product==null)
      {
          widget.allProducts=repository.getListOfProductsInShoppingList();
          if(widget.allProducts!=null &&
          widget.allProducts.length>0)
          {
            widget.productFiltered=widget.allProducts.where((p)=> p.code==widget.code).toList();
            if(widget.productFiltered!=null &&
            widget.productFiltered.length>0)

            {
              widget.product=widget.productFiltered[0];
              widget.code=widget.productFiltered[0].code;
            }
          }
      }
      }
     }
  }

  void addItem()
  {
    if(widget.isFromCart)
    {
      int cnt=repository.getShoppingCartVM().products[widget.position].count;
      repository.getShoppingCartVM().products[widget.position].count=cnt+1;
      //cartBloc.dispatch(IncrementEvent(count: cnt+1,amount:num.parse( repository.getShoppingCartVM().products[widget.position].priceB).toDouble(),code:repository.getShoppingCartVM().products[widget.position].code));
      BlocProvider.of<GlobalBloc>(context)
                  .shoppingCartBloc
                  .addition
                  .add(repository.getShoppingCartVM().products[widget.position]);
    }
    else
    {
      ShoppingCartProductVM new_item= new ShoppingCartProductVM(0,
      widget.product.name,
      widget.product.code,
      widget.product.allt,
      widget.product.priceB,
      widget.product.priceC,
      widget.product.description) ;

      if(repository.getShoppingCartVM().products!=null &&
      repository.getShoppingCartVM().products.length>0){
      List<ShoppingCartProductVM> item_in_cart=repository.getShoppingCartVM().products.where((p) => p.code==new_item.code).toList();
     if(item_in_cart!=null &&
     item_in_cart.length>0)
     {
      int index= repository.getShoppingCartVM().products.indexOf(item_in_cart[0]);
      if(index>=0)
      {
        if(repository.getShoppingCartVM().products[index].count==0)
        {
       // RxBus.post( ChangeEvent(message: 'INCREMENT_COUNTER'));
        }
        int existance=0;
        existance=num.tryParse(widget.product.allt)?.toInt();
        if(repository.getShoppingCartVM().products[index].count < existance) {
          repository
              .getShoppingCartVM()
              .products[index].count = repository
              .getShoppingCartVM()
              .products[index].count + 1;
          //RxBus.post( ChangeEvent(message: 'INCREMENT_AMOUNT',amount: num.tryParse(repository.getShoppingCartVM().products[widget.position].priceB)?.toDouble()));
          //cartBloc.dispatch(IncrementEvent(count: repository.getShoppingCartVM().products[index].count,amount:num.parse( repository.getShoppingCartVM().products[widget.position].priceB).toDouble(),code:repository.getShoppingCartVM().products[widget.position].code));
          BlocProvider
              .of<GlobalBloc>(context)
              .shoppingCartBloc
              .addition
              .add(repository
              .getShoppingCartVM()
              .products[index]);
        }
      }
     }
     else{
        new_item.count=1;
        new_item.catKey=widget.categorykey;
       if(repository.getShoppingCartVM().products==null ||
       repository.getShoppingCartVM().products.length==0)
       {
         repository.getShoppingCartVM().products=new List();
       }

      repository.getShoppingCartVM().products.add(new_item);
       //RxBus.post( ChangeEvent(message: 'INCREMENT_COUNTER'));
       // RxBus.post( ChangeEvent(message: 'INCREMENT_AMOUNT',amount: num.tryParse(new_item.priceB)?.toDouble()));
      //cartBloc.dispatch(IncrementEvent(count: new_item.count,amount:num.parse( new_item.priceB).toDouble(),code:new_item.code));
       BlocProvider.of<GlobalBloc>(context)
                  .shoppingCartBloc
                  .addition
                  .add(new_item);

     }
      }
     else
     {
       new_item.count=1;
       new_item.catKey=widget.categorykey;
       if(repository.getShoppingCartVM().products==null ||
       repository.getShoppingCartVM().products.length==0)
       {
         repository.getShoppingCartVM().products=new List();
       }
      repository.getShoppingCartVM().products.add(new_item);
      // RxBus.post( ChangeEvent(message: 'INCREMENT_COUNTER'));
       // RxBus.post( ChangeEvent(message: 'INCREMENT_AMOUNT',amount: num.tryParse(new_item.priceB)?.toDouble()));
        BlocProvider.of<GlobalBloc>(context)
                  .shoppingCartBloc
                  .addition
                  .add(new_item);
     }
   }
  }
  void removeItem( )
  {
if(widget.isFromCart)
    {
      int cnt=repository.getShoppingCartVM().products[widget.position].count;
      if(cnt>1) {
        repository.getShoppingCartVM().products[widget.position].count=cnt-1;
        //RxBus.post( ChangeEvent(message: 'DECREMENT_AMOUNT',amount: num.tryParse(repository.getShoppingCartVM().products[widget.position].priceB)?.toDouble()));
        if(repository.getShoppingCartVM().products[widget.position].count==0)
        {
         // RxBus.post( ChangeEvent(message: 'DECREMENT_COUNTER'));
        }
        BlocProvider.of<GlobalBloc>(context)
                  .shoppingCartBloc
                  .substraction
                  .add(repository.getShoppingCartVM().products[widget.position]);
      }
      else
      {
        if(cnt==1)
        {
          //RxBus.post( ChangeEvent(message: 'DECREMENT_COUNTER'));
          //RxBus.post( ChangeEvent(message: 'DECREMENT_AMOUNT',amount:num.tryParse(repository.getShoppingCartVM().products[widget.position].priceB)?.toDouble()));

          repository.getShoppingCartVM().products.removeAt(widget.position);
           BlocProvider.of<GlobalBloc>(context)
                  .shoppingCartBloc
                  .substraction
                  .add(repository.getShoppingCartVM().products[widget.position]);
        }
      }


    }
    else
    {
      /*ShoppingCartProductVM new_item= new ShoppingCartProductVM(0,
      repository.getMapOfProductsInCategory()[widget.categorykey][widget.position].name,
      repository.getMapOfProductsInCategory()[widget.categorykey][widget.position].code,
      repository.getMapOfProductsInCategory()[widget.categorykey][widget.position].allt,
      repository.getMapOfProductsInCategory()[widget.categorykey][widget.position].priceB,
      repository.getMapOfProductsInCategory()[widget.categorykey][widget.position].priceC,
      repository.getMapOfProductsInCategory()[widget.categorykey][widget.position].description) ;
      */
      List<ShoppingCartProductVM> item_in_cart=repository.getShoppingCartVM().products.where((p) => p.code==widget.product.code).toList();
     if(item_in_cart!=null &&
     item_in_cart.length>0)
     {
      int index= repository.getShoppingCartVM().products.indexOf(item_in_cart[0]);
      if(index>=0)
      {
        if(repository.getShoppingCartVM().products[index].count>1) {
          repository.getShoppingCartVM().products[index].count=repository.getShoppingCartVM().products[index].count-1;
        if(repository.getShoppingCartVM().products[index].count==0)
        {
         // RxBus.post( ChangeEvent(message: 'DECREMENT_COUNTER'));
        }
        //RxBus.post( ChangeEvent(message: 'DECREMENT_AMOUNT',amount: num.tryParse(repository.getShoppingCartVM().products[widget.position].priceB)?.toDouble()));
         BlocProvider.of<GlobalBloc>(context)
                  .shoppingCartBloc
                  .substraction
                  .add(repository.getShoppingCartVM().products[index]);
        }
        else
        {
          if(repository.getShoppingCartVM().products[index].count==1)
        {
         // RxBus.post( ChangeEvent(message: 'DECREMENT_COUNTER'));
         // RxBus.post( ChangeEvent(message: 'DECREMENT_AMOUNT',amount: num.tryParse(repository.getShoppingCartVM().products[widget.position].priceB)?.toDouble()));


           BlocProvider.of<GlobalBloc>(context)
                  .shoppingCartBloc
                  .substraction
                  .add(repository.getShoppingCartVM().products[index]);
           repository.getShoppingCartVM().products.removeAt(index);
        }
        }
      }
     }
     else
     {

     }
  }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
           return Navigator.pushReplacementNamed(context, "/home");
    },
    child:
      Scaffold(

      body:
      // BlocBuilder<CartEvent,CartState>(
      //       bloc: _cartBloc,
      //       builder: (BuildContext context,CartState state) {
      //         return
      StreamBuilder(
        stream:
            BlocProvider.of<GlobalBloc>(context).shoppingCartBloc.cartStream,
        initialData: ShoppingCart(),
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            if(snapshot.data is ShoppingCart)
            {
              this.count=snapshot.data.products.where((p)=> p.code==this.widget.code).toList().length;
            }
          }
          return
      Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade300, Colors.indigo.shade500]
              ),
            ),
          ),
          ListView.builder(
            itemCount: 2,
            itemBuilder: (context,index) =>
            StreamBuilder(
        stream:
            BlocProvider.of<GlobalBloc>(context).shoppingCartBloc.cartStream,
        initialData: ShoppingCart(),
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            if(snapshot.data is ShoppingCart)
            {
              this.count=snapshot.data.products.where((p)=> p.code==this.widget.code).toList().length;
            }
          }
          return
            _mainListBuilder(context,index);
            }
          ),
          ),
          new Positioned(

            left: 0.0,
            bottom: 0.0,
            child:
            new Container(
              margin: EdgeInsets.all(20.0),
              child:
            GestureDetector(

              onTap: (){
                Navigator.pushReplacementNamed(context, "/home");
               //Navigator.pop(context);
              },
              child: GMenu(),
            ),
          ),
          ),
        ],
      );
            },
      )

    ),
    );

  }

  Widget _mainListBuilder(BuildContext context, int index) {
    if(index==0) return _buildHeader(context);
    if(index==1) return _buildSectionHeader(context);

    // if(index==2) return Container(
    //   color: Colors.white,
    //   padding: EdgeInsets.only(left: 20.0, top: 30.0, bottom: 10.0),
    //   child: Text("محصولات مشابه",
    //     style: Theme.of(context).textTheme.title
    //   )
    // );
    // return _buildListItem();
  }

  Widget _buildListItem() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset('', fit: BoxFit.cover),
      ),
    );
  }

  Container _buildSectionHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            onPressed: (){
              addItem();
            },
         child: Icon(Icons.add_shopping_cart,color: Colors.greenAccent,size: 35.0,),
          ),
         StreamBuilder(
        stream:
            BlocProvider.of<GlobalBloc>(context).shoppingCartBloc.cartStream,
        initialData: ShoppingCart(),
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            if(snapshot.data is ShoppingCart)
            {
              List<ShoppingCartProductVM> filtered=snapshot.data.products.where((p)=> p.code==this.widget.code).toList();
               if(filtered!=null && filtered.length>0 && filtered[0]!=null)
               {
                 this.count=filtered[0].count;
               }
             }
          }
        return
          Expanded(

                          child: ListTile(
                            title: Text(Translations.current.countincart()+' '+this.count.toString()+' ',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(Translations.current.existance().toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 9.0) ),
                          ),
                        );
        },
         ),

          FlatButton(
            onPressed: (){
              removeItem();
            },
            child: new Icon(Icons.remove_shopping_cart,color: Colors.redAccent,size: 35.0,),
          )
        ],
      ),
    );
  }



Widget get productImage {
 return ClipRRect(
    borderRadius: new BorderRadius.all(Radius.circular(5.0)),

    child:
    new Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.0,color: Colors.pinkAccent,),
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child:

        CircleImage(width:MediaQuery.of(context).size.width/2 ,
        height: MediaQuery.of(context).size.width/2,
        imageUrl:widget.product.imageAdd, //SoapConstants.URL_IMAGE+widget.product.code+".jpg" ,
        radius: 100.0,),
  //   CachedNetworkImage(

  //   placeholder:(context, url) => new Container(
  //     decoration: BoxDecoration(
  //       border: Border.all(width: 0.5,color: Colors.pinkAccent,),
  //       borderRadius: BorderRadius.all(Radius.circular(3.0)),
  //     ),
  //   height: MediaQuery.of(context).size.width/2,
  //   width: MediaQuery.of(context).size.width/2,

  //   child: Icon(Icons.accessibility),

  // ),
  // colorBlendMode: BlendMode.src,
  // imageUrl: SoapConstants.URL_IMAGE+widget.product.code+".jpg",
  // errorWidget: (context,url,error) => Text(Translations.current.noimage(),
  // style: TextStyle(fontSize: 10.0,color: Colors.redAccent),),
  // width:MediaQuery.of(context).size.width/2,
  // height: MediaQuery.of(context).size.width/2,
  // fit: BoxFit.fill,
  //   ),
),
);

}
  Container _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      height: 400.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top:80.0, left: 40.0, right: 40.0, bottom: 2.0),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 110.0,),
                  Text(widget.product.name, style: Theme.of(context).textTheme.body1,),
                  SizedBox(height: 5.0,),
                  TextMarquee(Text(widget.product.description,overflow: TextOverflow.fade,softWrap: true,)),


                  Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(widget.product.priceB,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,),),
                            subtitle: Text(Translations.of(context).productUnitPrice().toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12.0,color: Colors.redAccent) ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(widget.product.allt,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(Translations.current.existance().toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12.0) ),
                          ),
                        ),
                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),
          Container(
                margin: EdgeInsets.only(left:80.0,right: 80.0),
                child:
          // Material(

          //     shape: RoundedRectangleBorder(

          //       borderRadius: BorderRadius.circular(5.0)),
          //     elevation: 1.0,
          //     color: Colors.white,
          //     child:

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                  new CircleImage(width: MediaQuery.of(context).size.width/2.0,
                  height:  MediaQuery.of(context).size.width/2.0,
                  radius: 200.0,
                  imageUrl:widget.product.imageAdd/*SoapConstants.URL_IMAGE+widget.product.code+".jpg"*/ ,
                ),
            ],
          ),
              //),
          ),
        ],
      ),
    );
  }

}


