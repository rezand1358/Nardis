import 'package:flutter/material.dart';
import 'package:nardis/bloc/shopcart/shoppingcart_bloc.dart';
import 'package:nardis/components/CircleImage.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_products_of_subcategory.dart';
import 'package:nardis/models/viewmodels/product_details_vm.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/widgets/appbar_collapse.dart';


class ProductListItem extends StatefulWidget
{

  final ProductSummary item;
  final int position;
  final ShoppingCartBloc _shoppingCartBloc;
  ProductListItem(this.item,this.position,this._shoppingCartBloc);

  @override
  ProductListItemState createState() {
    
    return new ProductListItemState();
  }

}

class ProductListItemState extends State<ProductListItem>
{
  String renderUrl;
  Size screenSize;


  ProductListItemState();


  @override
  void initState() {
    super.initState();
   // renderProgramPic();
  }


  void renderProgramPic() async {
    // await coach.getImageUrl();
    setState(() {
      renderUrl= "";
    });
  }


  Widget productImage(){
    return CircleImage(height: 100.0,width: 100.0,imageUrl: widget.item.imageAdd/*SoapConstants.URL_IMAGE+ widget.item.code+'.jpg'*/,radius: 50.0,);
  }

  Widget itemImage() {
    var itemAvatar = new Hero(
      tag: widget.item,
      child: new Container(
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: new NetworkImage(widget.item.imageAdd/*SoapConstants.URL_IMAGE+ widget.item.code+".jpg"*/),
          ),
        ),
      ),
    );

    var placeholder = new Container(
        width: 50.0,
        height: 50.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          gradient: new LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, Colors.transparent, Colors.blueGrey[100]],
          ),
        ),
        alignment: Alignment.center,
      
        child: new Text('بدون عکس',style:new TextStyle(fontSize: 9.0,color: Colors.redAccent)),
        );

    var crossFade = new AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: itemAvatar,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: new Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  Widget get itemCard {
    return new Positioned(
      right: 0.0,
      top: 0.0,
      child: new Container(
        margin: EdgeInsets.all(3.0),
        width: screenSize.width-50.0,
        height: 135.0,
        child: new Card(
          margin: EdgeInsets.only(top: 10.0, bottom: 18.0),
          color: Color(0x100288D1),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(40.0),bottomLeft: Radius.circular(3.0) ),
          ),
          child: new Padding(
            padding: const EdgeInsets.only(
              top: 2.0,
              bottom: 0.0,
              left: 2.0,
            ),
            child: new Container(
              constraints: new BoxConstraints.expand(
                height: 210.0,
              ),
              padding: new EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
              decoration: new BoxDecoration(

              ),
              child: new Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  new Container(
                    constraints: new BoxConstraints.expand(
                      height: 180.0,
                      width: 200.0,
                    ),
                    margin: EdgeInsets.only(right: 105.0,bottom: 2.0),
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          new Text(widget.item.name,
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              )
                          ),

                          new Text('',
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              )

                          ),
                          new Text( widget.item.description,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.rtl,
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              )

                          ),
                          
                        ]
                    ),

                  ),
                  /*new Positioned(
                    left: 0.0,
                    bottom: -20.0,
                    child:*/
                  new Positioned(
                      right: -18.0,
                      bottom: -10.0,
                      child: new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[

                            new Icon(Icons.stars,color: Colors.greenAccent,size: 34.0,),
                            new Text('',style: new TextStyle(color: Colors.blueAccent[100],fontSize: 14.0,fontWeight: FontWeight.bold),),
                          ]
                      )
                  ),
                  new Positioned(
                      left: 0.0,
                      bottom: -20.0,
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: <Widget>[

                          /*new Stack(
                    overflow: Overflow.visible ,
                        children: <Widget>[*/

                          /*Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: new Text('20000',style: new TextStyle(color: Colors.pink[100],fontSize: 12.0,
                                letterSpacing: 1.0,
                                wordSpacing: 5.0,
                                fontWeight: FontWeight.bold),),
                          ),*/
                          /*Padding(
                            padding:
                            EdgeInsets.only(
                                left: 8.0,
                                bottom: 0.0,
                                right: 0.0,
                                top: 0.0
                            ),
                            child: new Icon(Icons.monetization_on,color: Colors.blueAccent[200],size: 26.0,),
                          ),*/

                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       left: 8.0,
                          //       bottom: 0.0,
                          //       right: 8.0,
                          //       top: 0.0
                          //   ),
                          //   child: new Icon(Icons.thumb_up,color: Colors.amber[200],size: 30.0,),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0.0,
                                bottom: 0.0,
                                right: 8.0,
                                top: 0.0
                            ),
                            child: new Icon(Icons.add_shopping_cart,color: Colors.greenAccent,size: 32.0,),
                          ),

                        ],

                        // ),

                        // ],
                      )



                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize=MediaQuery.of(context).size;

    return new InkWell(
      onTap: () => 
        _loadProducts(widget.item.code,widget.position),
     
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: new Container(
          padding: EdgeInsets.all(3.0),
          margin: EdgeInsets.all(4.0),
          height: 125.0,
          child: new Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              itemCard,
              new Positioned(top: -14.0,right: -10.0, child:  productImage()),

            ],
          ),
        ),
      ),
    );
  }

  
  _loadProducts(String productCode,int index)
  {
      Navigator.pushReplacementNamed(context, '/productdetails',arguments: new ProductDetailsVM(productSummary: widget.item ,position: index) );
  }

}
