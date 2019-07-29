import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nardis/bloc/basic/bloc_provider.dart';
import 'package:nardis/bloc/basic/global_bloc.dart';
import 'package:nardis/bloc/shopcart/shoppingcart_bloc.dart';
import 'package:nardis/components/CircleImage.dart';
import 'package:nardis/components/product_list_item.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/models/viewmodels/product_details_vm.dart';
import 'package:nardis/models/viewmodels/product_list_vm.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/repository/product/center_repository.dart';
import 'package:nardis/translation_strings.dart';
import 'package:nardis/ui/product/product_details.dart';
import 'package:nardis/widgets/appbar_collapse.dart';

class ProductsList extends StatefulWidget {

// CategoryItem catItem;
// List<ProductSummary> products=new List();
// bool isFromCart=false;

ProductListVM item;
ProductsList({this.item});

  @override
  _ProductsListState createState() {
    return _ProductsListState();
  }


}

class _ProductsListState extends State<ProductsList>
{

Container _buildSectionHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            onPressed: (){

            },
         child: Icon(Icons.add_shopping_cart,color: Colors.greenAccent,size: 35.0,),
          ),
          FlatButton(
            onPressed: (){
              
            },
            child: new Icon(Icons.remove_shopping_cart,color: Colors.redAccent,size: 35.0,),
          )
        ],
      ),
    );
  }

 

Widget  productImage(String code) {
 return  CircleImage(width: 50.0,height: 50.0,imageUrl:SoapConstants.URL_IMAGE+code+'.jpg' ,radius: 50.0,);
//     child: CachedNetworkImage(

//     placeholder:(context, url) => new Container(
//     height: 200.0,
//     width: 200.0,
//     child: Icon(Icons.accessibility),
//     color: Colors.blueAccent,
//   ),
//   imageUrl: SoapConstants.URL_IMAGE+code+".jpg",
//   errorWidget: (context,url,error) => Image.asset('assets/images/no_image.png'),
//   width:200.0,
//   height: 200.0,
//   fit: BoxFit.fill,
// ));
 
}
  Container _buildHeader(BuildContext context,String name,String description,String code) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      height: 380.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 90.0, left: 40.0, right: 40.0, bottom: 2.0),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 90.0,),
                  Text(name, style: Theme.of(context).textTheme.title,),
                  SizedBox(height: 5.0,),
                  Text(description),
                  SizedBox(height: 5.0,),
                  Text(''),
                  SizedBox(height: 16.0,),
                  Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(code,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,),),
                            subtitle: Text(Translations.of(context).age().toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12.0,color: Colors.redAccent) ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text("",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text("".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12.0) ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(code,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(Translations.of(context).age().toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12.0,color: Colors.redAccent) ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                  productImage(code),
            ],
          ),
        ],
      ),
    );
  }

createItemsContents(String name,String code,String description,BuildContext context)
{
  _buildHeader(context, name, description, code);
  _buildSectionHeader(context);
}

int count=0;
@override
void initState() {
    super.initState();
    count=widget.item.products.length;
    // if(!widget.item.isFromCart)
    // widget.item.products=repository.getMapOfProductsInCategory()[widget.item.catItem.title];
    // else
    // widget.item.products=repository.getListOfProductsInShoppingList()[widget.item.catItem.title];

  }

  @override
  Widget build(BuildContext context) {
    ShoppingCartBloc _shopBloc=BlocProvider.of<GlobalBloc>(context).shoppingCartBloc;
    return  Scaffold(
      appBar: AppBar(
      actions: <Widget>[
          Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.close,color: Colors.yellowAccent,size: 32.0,),
        onPressed: () { Navigator.popAndPushNamed(context,'/home'); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),
  
      ],
      leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.home),
        onPressed: () { Navigator.pushReplacementNamed(context,'/home'); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),
      title: Text(Translations.current.productslist(),style: TextStyle(fontSize: 20.0,color: Colors.yellowAccent),),
    ),
      body:
        new ListView.builder(
            padding: EdgeInsets.only(top: 6.0),
            
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: widget.item.products.length,
            itemBuilder:(context, index) => 
             new ProductListItem(widget.item.products[index],index,_shopBloc),
             
            // createItemsContents(widget.item.products[index].name,
            // widget.item.products[index].code,
            // widget.item.products[index].description,
            // context),
          )
    );
  }
  
}